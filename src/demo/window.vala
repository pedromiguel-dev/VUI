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
    public Overlay over() {
        return new Overlay() {
                   expand = { true, true },
                   content = new ScrolledBox() {
                       child = new VBox() {
                           spacing = 20,
                           children = {
                               new Button(),
                               new Button(),
                               new Button(),
                               new Button(),
                               new Button() {
                                   on_click = () => print("hey")
                               },
                           }
                       }
                   },
                   overlay = new Button.from_icon_name("list-add-symbolic") {
                       halign = Gtk.Align.END, valign = Gtk.Align.END,
                       margins = { 0, 0, 20, 0 },
                       expand = { true, false },
                       css_classes = { "fill", "circular", "suggested-action", "filter-icon" },
                       on_click = () => {
                           new Dialog() {
                               title = "new dialog",
                               content_size = { 600, 500 },
                               child = new ToolBar() {
                                   top_bar = new HeaderBar(),
                                   content = new VBox() {
                                       valign = Gtk.Align.CENTER,
                                       children = {
                                           new Label("TESTE") {
                                               css_classes = { "title-1" }
                                           }
                                       }
                                   }
                               }
                           };
                       }
                   }
        };
    }

    public Window MainWindow(Adw.Application app) {
        var title_box = new HBox() {
            children = {
                new Label("Journal") {
                    css_classes = { "title-1", "title-bigger" },
                    halign = Gtk.Align.START,
                    valign = Gtk.Align.CENTER,
                },
                new PageLink() {
                    halign = Gtk.Align.END,
                    valign = Gtk.Align.CENTER,
                    hexpand = true,
                    trigger = new Label("Hey")
                }
                // new PageLink() {
                // trigger = new Button.from_icon_name("view-sort-descending-rtl-symbolic") {
                // halign = Gtk.Align.END,
                // valign = Gtk.Align.CENTER,
                // hexpand = true,
                // css_classes = { "flat", "circular", "filter-icon" },
                // on_click = () => print("inner btn\n")
                // }
                // }
            }
        };


        var push = new Vui.Model.Store<bool> (false);

        return new Window(app) {
                   content = new Navigation() {
                       navigation_pages = {
                           new ToolBar() {
                               title = "Home",
                               top_bar = new HeaderBar() {
                                   show_back_button = false,
                                   show_title = false,
                               },
                               content = new VBox() {
                                   spacing = 10,
                                   valign = Gtk.Align.FILL,
                                   expand = { true, true },
                                   margins = { 0, 20, 0, 20 },
                                   children = { title_box, over() },
                               }
                           }
                       }
                   }
        };

        // return new Window(app) {
        // content = new ToolBar() {
        // top_bar = new HeaderBar() {
        // show_back_button = false,
        // show_title = false,
        // },
        // content = new VBox() {
        // spacing = 10,
        // valign = Gtk.Align.FILL,
        // expand = { true, true },
        // margins = { 0, 20, 0, 20 },
        // children = { title_box, over() },
        // }
        // }
        // };
    }
}
