import sys

MODES = {".TEXT": "p", ".HEAD": "h1", ".LINK": "a", ".IMAGE": "img"}


def main():
    input = sys.stdin.readlines()
    previous_line: str = None
    tag_open = False
    current_mode = ".TEXT"
    accum = ""

    for line in input:
        if line.strip() in MODES:
            current_mode = line.strip()

        elif line == "\n" and tag_open:
            accum += f"</{MODES[current_mode]}>"
            tag_open = False

        elif previous_line == "\n" and line != "\n" and not tag_open:
            accum += f"\n<{MODES[current_mode]}"
            if current_mode == ".LINK":
                accum += f" href='{line.strip()}'"
            elif current_mode == ".IMAGE":
                accum += f" src='{line.strip()}'"
            accum += ">\n"
            tag_open = True
            accum += f"   {line}"

        else:
            accum += f"   {line}"
        previous_line = line

    if tag_open:
        accum += f"\n</{MODES[current_mode]}>"

    print(accum)


if __name__ == "__main__":
    main()
