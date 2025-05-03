
"""コンソールからコピーしようとすると行末空白を取りこぼしたりするので、リダイレクトして使うのが望ましい。
"""

from calendar import Calendar
from sys import argv
import re
import time


class Month:
    """年/月を示す。
    - 型ヒントを書けるようにすること
    - 一致比較を手軽に書けるようにすること
    - タプルよりもマシな見た目
    が目的。"""

    def __init__(self, year: int, month: int) -> None:
        self.year = year
        self.month = month

    def __eq__(self, other: 'Month') -> bool:
        return self.year == other.year and self.month == other.month


def print_term_links(from_month: Month, to_month: Month) -> None:
    """全期間のリンク。今年と去年は1行1年。それ以前は1行にすべての年。"""
    def print_months(year: int, from_: int, to: int):
        """1年分の月毎のリンク。今月は '今月' と表示"""
        for month in range(from_, to+1):
            displayMonth = '今' if to_month == Month(year, month) else month
            print(f'[{displayMonth}月]({year}-{month:0>2}.md) ', end='')

    def print_year(year: int) -> None:
        """1年分のリンク。冒頭にREADME.mdへのリンク、続けて月ごとのリンク"""
        print(f'[{year}](README.md#{year}) ', end='')
        first_month = 1 if from_month.year != year else from_month.month
        last_month = 12 if to_month.year != year else to_month.month
        print_months(year, first_month, last_month)
        print(' ')  # markdown <br>

    # 今年と去年を1行ずつ
    last_year = max(from_month.year, to_month.year-1)   # max(初年, 去年)
    for year in reversed(range(last_year, to_month.year+1)):  # noqa: E501 今年を表示するので、rangeは来年まで
        print_year(year)

    # それ以前は年だけ列挙
    for year in reversed(range(from_month.year, last_year)):
        print(f'[{year}](README.md#{year}) ', end='')
    print(' ')  # markdown <br>


def print_month_header(target: Month) -> None:
    print('')
    print(f'{target.year}年{target.month}月')
    print('=========')
    print('')


def print_month_calendar(target: Month) -> None:
    kanji_wdays = ('月', '火', '水', '木', '金', '土', '日', )
    cal = Calendar(firstweekday=6)

    print('|Sun|Mon|Tue|Wen|Thu|Fri|Sat|')
    print('|---|---|---|---|---|---|---|')
    for week in cal.monthdatescalendar(target.year, target.month):
        for date in week:
            prefix = '' if date.month == target.month else f'{date.year}-{date.month:0>2}.md'  # noqa: E501
            print(f'|[{date.day}]', end='')
            print(f'({prefix}#{date.month:0>2}{date.day:0>2}-{kanji_wdays[date.weekday()]})', end='')  # noqa: E501
        print('|')


def extract_arguments() -> Month:
    if len(argv) > 1:
        spec = re.split('[^0-9]', argv[1])
        if len(spec) == 1 and len(argv) > 2:
            spec.append(argv[2])
        try:
            return Month(int(spec[0]), int(spec[1]))
        except Exception:
            print("specify month.")
            exit()
    else:
        now = time.localtime()
        return Month(now.tm_year, now.tm_mon)


first_month = Month(2020, 4)
target_month = extract_arguments()
print_term_links(first_month, target_month)

print_month_header(target_month)
print_month_calendar(target_month)

print('')
