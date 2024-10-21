import matplotlib.pyplot as plt
from matplotlib import font_manager


COLOR_PINK = "#ff007f"
COLOR_VIOLET = "#9700ff"
COLOR_BLUE = "#0082ff"
COLOR_CYAN = "#00ffc3"
COLOR_GREEN = "#02fe00"


plt.rcParams["font.size"] = 24
plt.rcParams["legend.labelcolor"] = COLOR_VIOLET


def fix_axes_style(ax: plt.Axes) -> plt.Axes:
    for spine in ax.spines.values():
        spine.set_color(COLOR_VIOLET)
        spine.set_linewidth(5)
    ax.xaxis.label.set_color(COLOR_VIOLET)
    ax.yaxis.label.set_color(COLOR_VIOLET)
    ax.tick_params(axis="x", colors=COLOR_VIOLET)
    ax.tick_params(axis="y", colors=COLOR_VIOLET)
    return ax
