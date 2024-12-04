draw_self();

draw_set_font(fnt_gacha);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x + 40, y + 0, string("") + string(global.token));

draw_set_halign(fa_left);
draw_set_valign(fa_top);