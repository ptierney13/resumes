from __future__ import annotations

import argparse
from pathlib import Path


DEFAULT_RESUME_TEMPLATE = Path(
    "Templates/Resumes/page-layouts/current-standard/resume.tex"
)
ACTIVE_APPLICATION_FILE = Path("preview/active-application.txt")


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
    (repo_root / ACTIVE_APPLICATION_FILE.parent).mkdir(parents=True, exist_ok=True)

    title_line = args.title or args.job_slug.replace("-", " ").title()
    posting_url = args.posting_url or "<paste posting url here>"
    baseline_resume = repo_root / DEFAULT_RESUME_TEMPLATE

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
        "## Summary Line Decision\n\n"
        "- \n\n"
        "## Heading And Structure Options\n\n"
        "- \n\n"
        "## Questions For Patrick\n\n"
        "- \n\n"
        "## Candidate Bullets\n\n"
        "- \n\n"
        "## Relevant Documented Points Not Included In Current Draft\n\n"
        "- \n\n"
        "## Wording Changes Made\n\n"
        "- \n\n"
        "## Propagation Decisions\n\n"
        "- \n",
    )
    write_if_missing(
        target / "decision-summary.md",
        "# Decision Summary\n\n"
        "## Themes Emphasized\n\n"
        "- \n\n"
        "## Summary And Structure Decisions\n\n"
        "- \n\n"
        "## Important Bullets Included\n\n"
        "- \n\n"
        "## Cuts Or De-Emphasis\n\n"
        "- \n\n"
        "## Propagation Decisions\n\n"
        "- \n\n"
        "## Open Questions Or Risks\n\n"
        "- \n",
    )
    if baseline_resume.exists():
        write_if_missing(
            target / "resume.tex",
            baseline_resume.read_text(encoding="utf-8"),
        )

    (repo_root / ACTIVE_APPLICATION_FILE).write_text(
        str(target),
        encoding="utf-8",
    )

    print(target)


if __name__ == "__main__":
    main()
