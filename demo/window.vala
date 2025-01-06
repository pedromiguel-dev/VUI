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
    public class LockIcon : Vui.Impl.Derived {
        public LockIcon () {
            derived = new VBox () {
                content = {
                    new Image.from_icon_name ("system-lock-screen-symbolic") {
                        pixel_size = 32,
                        halign = Gtk.Align.CENTER,
                        css_classes = { "lock-icon-image-invert" }
                    }
                },
                css_classes = { "lock-icon" },
                halign = Gtk.Align.CENTER,
                spacing = 10
            };
        }
    }

    public Overlay over () {

        var string = new Vui.Model.Store<string> ("");
        string.changed.connect ((state) => print (string.state));

        return new Overlay () {
                   expand = { true, true },
                   content = new ScrolledBox () {
                       content = new VBox () {
                           spacing = 20,
                           content = {
                               new Button () {
                                   on_click = () => {
                                       new AlertDialog ("Hey it's a dialog!", "This is just a presentaion") {
                                           content = new VBox () {
                                               content = {
                                                   new LockIcon (),
                                                   new Entry ("Type your password") {
                                                       string_bufer = string
                                                   }
                                               },
                                               expand = { true, true }
                                           },
                                           action = { "Try me." },
                                           action_suggested = "Close window",
                                           action_destructive = "Cancel",
                                           on_response = (response) => print (response)
                                       };
                                   }
                               },
                               new Button (),
                               new Button (),
                               new Button (),
                               new Button () {
                                   on_click = () => print ("hey")
                               },
                           }
                       }
                   },
                   overlay = new Button.from_icon_name ("list-add-symbolic") {
                       halign = Gtk.Align.END, valign = Gtk.Align.END,
                       margins = { 0, 0, 20, 0 },
                       expand = { true, false },
                       css_classes = { "fill", "circular", "suggested-action", "filter-icon" },
                       on_click = () => {
                           new Dialog () {
                               title = "new dialog",
                               content_size = { 600, 500 },
                               content = new ToolBar () {
                                   top_bar = new HeaderBar (),
                                   content = new VBox () {
                                       valign = Gtk.Align.CENTER,
                                       content = {
                                           new Label ("TESTE") {
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

    public Window MainWindow (Adw.Application app) {

        var second_screen = new ToolBar () {
            title = "Second",
            top_bar = new HeaderBar (),
            content = new VBox () {
                spacing = 10,
                valign = Gtk.Align.FILL,
                expand = { true, true },
                margins = { 0, 20, 0, 20 },
                content = {
                    new VBox () {
                        valign = Gtk.Align.CENTER,
                        content = {
                            new Label ("TESTE") {
                                css_classes = { "title-1" }
                            }
                        }
                    }
                },
            }
        };

        var third_screen = new ToolBar () {
            title = "Tird screen",
            top_bar = new HeaderBar (),
            content = new VBox () {
                spacing = 10,
                valign = Gtk.Align.FILL,
                expand = { true, true },
                margins = { 0, 20, 0, 20 },
                content = {
                    new VBox () {
                        valign = Gtk.Align.CENTER,
                        content = {
                            new Label ("3º Tela") {
                                css_classes = { "title-1" }
                            }
                        }
                    }
                },
            }
        };

        var title_box = new HBox () {
            content = {
                new Label ("Journal") {
                    css_classes = { "title-1", "title-bigger" },
                    halign = Gtk.Align.START,
                    valign = Gtk.Align.CENTER,
                },
                new PageLink (second_screen) {
                    trigger = new Label ("Hey"),
                    halign = Gtk.Align.END,
                    valign = Gtk.Align.CENTER,
                    hexpand = true,
                },
                new PageLink (third_screen) {
                    trigger = new Label ("third screen"),
                    halign = Gtk.Align.END,
                    valign = Gtk.Align.CENTER,
                    hexpand = true,
                }
            }
        };

        return new Window (app) {
                   content = new Navigation () {
                       pages = {
                           new ToolBar () {
                               title = "Home",
                               top_bar = new HeaderBar () {
                                   show_back_button = false,
                                   show_title = false,
                               },
                               content = new VBox () {
                                   spacing = 10,
                                   valign = Gtk.Align.FILL,
                                   expand = { true, true },
                                   margins = { 0, 20, 0, 20 },
                                   content = { title_box, over () },
                               }
                           }
                       }
                   }
        };
    }
}
