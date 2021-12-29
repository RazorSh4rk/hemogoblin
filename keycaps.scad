big_legends = [
    "qwertyuiop",
    "asdfghjkl",
    "zxcvbnm",
    "1234567890",
    "~-+{}|:\"<>?"
];

small_legends = [
    "          ",
    "         ",
    "       ",
    "!@#$%^&*()",
    "` =[]\;',./"
];

gap = 20;
small_legend_x_offset = -8;
small_legend_y_offset = 6;

module cap() {
    import("choc.stl");
}

for(j = [0 : len(big_legends) - 1]) {
    color("green")
    mirror([-1, 0, 0])
    for(i = [0 : len(big_legends[j]) - 1]) {
        translate([i * gap + gap / 4, gap * j + gap / 4, 5])
        mirror([0, 0, -1])
        cap();
    }
    
    color("black")
    linear_extrude(0.1)
    translate([0, j * gap, 0])
    mirror([-1, 0, 0])
    for(i = [0 : len(big_legends[j]) - 1]) {
        translate([gap * i, 0, 0])
        text(big_legends[j][i], size=6, font="Droid Sans Mono:style=Regular");
    }
    
    color("white")
    linear_extrude(0.1)
    translate([small_legend_x_offset, j * gap + small_legend_y_offset, 0])
    mirror([-1, 0, 0])
    for(i = [0 : len(small_legends[j]) - 1]) {
        translate([gap * i, 0, 0])
        text(small_legends[j][i], size=4, font="Droid Sans Mono:style=Regular");
    }
}