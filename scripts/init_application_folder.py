from __future__ import annotations

import argparse
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create a standard application folder for a company and job posting."
    )
    parser.add_argument("company", help="Company folder name, for example 'Acme'")
    parser.add_argument("job_slug", help="Lowercase hyphenated job slug")
    parser.add_argument("--title", default="", help="Human-readable job title")
    parser.add_argument("--posting-url", default="", help="Source URL for the job posting")
    parser.add_argument(
        "--root",
        default=".",
        help="Repository root. Defaults to the current working directory.",
    )
    return parser.parse_args()


def write_if_missing(path: Path, content: str) -> None:
    if path.exists():
        return
    path.write_text(content, encoding="utf-8")


def main() -> None:
    args = parse_args()
    repo_root = Path(args.root).resolve()
    target = repo_root / "Applications" / args.company / args.job_slug
    target.mkdir(parents=True, exist_ok=True)

    title_line = args.title or args.job_slug.replace("-", " ").title()
    posting_url = args.posting_url or "<paste posting url here>"

    write_if_missing(
        target / "job-posting.md",
        f"# Job Posting\n\n"
        f"- Company: {args.company}\n"
        f"- Role: {title_line}\n"
        f"- Source: {posting_url}\n\n"
        f"## Posting Text\n\n"
        f"<!-- Paste the job posting here. -->\n",
    )
    write_if_missing(
        target / "working-notes.md",
        "# Working Notes\n\n"
        "## Requirement Coverage\n\n"
        "- \n\n"
        "## Questions For Patrick\n\n"
        "- \n\n"
        "## Candidate Bullets\n\n"
        "- \n",
    )
    write_if_missing(
        target / "decision-summary.md",
        "# Decision Summary\n\n"
        "## Themes Emphasized\n\n"
        "- \n\n"
        "## Important Bullets Included\n\n"
        "- \n\n"
        "## Cuts Or De-Emphasis\n\n"
        "- \n\n"
        "## Open Questions Or Risks\n\n"
        "- \n",
    )

    print(target)


if __name__ == "__main__":
    main()
