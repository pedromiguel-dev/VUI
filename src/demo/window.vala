/* window.vala
 *
 * Copyright 2024-2025 Pedro Miguel
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

using Vui.Widget;

namespace Demo {
    public Window MainWindow(Adw.Application app) {

        int numbers[4] = { 0, 1, 2, 3 };

        var title_box = HBox({
            Label("Journal") {
                css_classes = { "title-1", "title-bigger" },
                halign = Gtk.Align.START,
            },
            Button.from_icon_name("view-sort-descending-rtl-symbolic") {
                halign = Gtk.Align.END,
                vexpand = true, hexpand = true,
                css_classes = { "flat", "circular", "filter-icon" }
            }
        }) {
            valign = Gtk.Align.CENTER
        };


        return Window(app)
                .child(
                       ToolBar(
                               HeaderBar()
                                .show_back_button(false)
                                .show_title(false),
                               HBox({ title_box }) {
									vexpand = true, hexpand = true,
									valign = Gtk.Align.START,
									margin_top = 0, margin_left = 20,
									margin_bottom = 0, margin_right = 20
								}
                               .spacing(10)
                       )
                );
    }
}
