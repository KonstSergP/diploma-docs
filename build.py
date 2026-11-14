"""Export one document or the full suite; live previews do not use this script."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent

def find_compiler(explicit):
    if explicit:
        return explicit
    for command in ('typst', 'tinymist'):
        executable = shutil.which(command)
        if executable:
            return executable
    binary = 'tinymist.exe' if os.name == 'nt' else 'tinymist'
    candidates = [
        path for path in (Path.home() / '.vscode' / 'extensions').glob(
            f'myriad-dreamin.tinymist-*/out/{binary}'
        )
        if path.is_file() and os.access(path, os.X_OK)
    ]
    if candidates:
        return str(max(candidates, key=lambda path: path.stat().st_mtime))
    raise SystemExit('Compiler not found. Install Typst CLI or pass --compiler /path/to/typst.')

def main():
    documents = json.loads((ROOT / 'documents.json').read_text(encoding='utf-8'))
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('document', nargs='?', default='all', choices=['all', *documents])
    parser.add_argument('--list', action='store_true')
    parser.add_argument('--compiler', help='Path to Typst CLI or Tinymist')
    args = parser.parse_args()
    if args.list:
        for key, spec in documents.items():
            print(f"{key}: {spec['title']}")
        return
    compiler = find_compiler(args.compiler)
    compile_args = [compiler, 'compile', '--root', str(ROOT)]
    fonts = ROOT / 'fonts'
    if fonts.is_dir():
        compile_args.extend(['--font-path', str(fonts)])
    selected = documents if args.document == 'all' else {args.document: documents[args.document]}
    for key, spec in selected.items():
        output = ROOT / spec['output']
        output.parent.mkdir(parents=True, exist_ok=True)
        print(f'Building {key}', flush=True)
        subprocess.run([*compile_args, str(ROOT / spec['source']), str(output)], check=True)
        print(output, flush=True)

if __name__ == '__main__':
    try:
        main()
    except subprocess.CalledProcessError as error:
        sys.exit(error.returncode)
