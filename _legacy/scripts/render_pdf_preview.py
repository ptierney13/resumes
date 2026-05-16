from __future__ import annotations

import argparse
import importlib
import sys
from pathlib import Path


def load_pdfium():
    try:
        return importlib.import_module("pypdfium2")
    except ImportError:
        repo_root = Path(__file__).resolve().parents[1]
        local_python_dir = repo_root / ".local-tools" / "python"
        if local_python_dir.exists():
            sys.path.insert(0, str(local_python_dir))
            return importlib.import_module("pypdfium2")
        raise


def main() -> int:
    parser = argparse.ArgumentParser(description="Render the first page of a PDF to PNG.")
    parser.add_argument("pdf", help="Path to the source PDF")
    parser.add_argument("output", help="Path to the output PNG")
    parser.add_argument("--scale", type=float, default=2.0, help="Render scale factor")
    args = parser.parse_args()

    try:
        pdfium = load_pdfium()
    except ImportError as exc:
        print(f"Missing dependency: {exc}", file=sys.stderr)
        return 1

    pdf_path = Path(args.pdf).resolve()
    output_path = Path(args.output).resolve()
    output_path.parent.mkdir(parents=True, exist_ok=True)

    pdf = pdfium.PdfDocument(str(pdf_path))
    page = pdf[0]
    bitmap = page.render(scale=args.scale)
    image = bitmap.to_pil()
    image.save(output_path)

    print(output_path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
