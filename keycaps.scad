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
small_legend_x_offset = -7;
small_legend_y_offset = 5;

module cap() {
    import("choc_flat.stl");
}

module caps(j) {
    color("green")
    mirror([-1, 0, 0])
    for(i = [0 : len(big_legends[j]) - 1]) {
        translate([i * gap + gap / 4, gap * j + gap / 4, 4])
        mirror([0, 0, -1])
        cap();
    }
}

module legends(j) {
    color("black")
    linear_extrude(0.3)
    translate([0, j * gap, 0])
    mirror([-1, 0, 0])
    for(i = [0 : len(big_legends[j]) - 1]) {
        translate([gap * i, 0, 0])
        text(big_legends[j][i], size=6, font="Droid Sans Mono:style=Regular");
    }
    
    color("white")
    linear_extrude(0.3)
    translate([small_legend_x_offset, j * gap + small_legend_y_offset, 0])
    mirror([-1, 0, 0])
    for(i = [0 : len(small_legends[j]) - 1]) {
        translate([gap * i, 0, 0])
        text(small_legends[j][i], size=5, font="Droid Sans Mono:style=Regular");
    }
}

for(j = [0 : len(big_legends) - 1]) {
    caps(j);
    legends(j);
}