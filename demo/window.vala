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
using Vui.Model;
using Vui.Impl;
using Vui.Flow;

namespace Demo {
    public class Home : Derived {
        construct {
            derived = new Navigation () {
                pages = {
                    new ToolBar () {
                        title = "Home",
                        top_bar = new HeaderBar (),
                        content = new VBox () {
                            spacing = 10,
                            valign = Gtk.Align.FILL,
                            vexpand = true,
                            hexpand = true,
                            margin_end = 20,
                            margin_start = 20,
                            content = {
                                new HBox () {
                                    content = {
                                        new Label ("Journal") {
                                            css_classes = { "title-1", "title-bigger" },
                                            halign = Gtk.Align.START,
                                            valign = Gtk.Align.CENTER,
                                        }
                                    }
                                },
                                new Overlay ()
                            },
                        }
                    }
                }
            };
        }
    }

    public class Overlay : Derived {
        construct {
            derived = new Vui.Widget.Overlay () {
                hexpand = true,
                vexpand = true,
                content = new ScrolledBox () {
                    content = new VBox () {
                        spacing = 20,
                        content = {
                            new Button.with_label ("Dialog") {
                                on_click = () => {
                                    new AlertDialog ("Hey it's a dialog!", "This is just a presentaion") {
                                        content = new VBox () {
                                            content = {
                                                new Entry ("Type your password")
                                            },
                                            hexpand = true,
                                            vexpand = true
                                        },
                                        action = "Try me.",
                                        action_suggested = "Close window",
                                        action_destructive = "Cancel",
                                    };
                                }
                            },
                            new PageLink (new FormScreen ()) {
                                trigger = new Button.with_label ("Account Screen"),
                                valign = Gtk.Align.CENTER,
                                hexpand = true,
                            },
                            new PageLink (new StateScreen ()) {
                                trigger = new Label ("third screen"),
                                halign = Gtk.Align.END,
                                valign = Gtk.Align.CENTER,
                                hexpand = true,
                            },
                        }
                    }
                },
                overlay = new Button.from_icon_name ("list-add-symbolic") {
                    halign = Gtk.Align.END,
                    valign = Gtk.Align.END,
                    margin_bottom = 20,
                    hexpand = true,
                    vexpand = true,
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
    }

    public class StateScreen : Derived {
        private Store<string> state = new Store<string> ("There must be something here");
        private Store<bool> state2 = new Store<bool> (false);

        construct {
            derived = new ToolBar () {
                title = "Reacting to changes",
                top_bar = new HeaderBar (),
                content = new VBox () {
                    spacing = 10,
                    valign = Gtk.Align.CENTER,
                    halign = Gtk.Align.FILL,
                    margin_end = 20,
                    margin_start = 20,
                    content = {
                        new ShowIf (state2) {
                            content = {
                                new Label.ref (state) {
                                    css_classes = { "title-1" },
                                    margin_bottom = 30,
                                    wrap = true,
                                }
                            }
                        },
                        new Section () {
                            halign = Gtk.Align.FILL,
                            content = {
                                new Entry ("Type your password") {
                                    hexpand = true,
                                    bind_buffer = state
                                },
                            }
                        },
                        new Button.with_label ("Click me!!") {
                            css_classes = { "pill" },
                            halign = Gtk.Align.CENTER,
                            on_click = () => state2.state = !state2.state
                        }
                    },
                }
            };
        }
    }

    public class FormScreen : Derived {


        construct {
            derived = new ToolBar () {
                title = "Form",
                top_bar = new HeaderBar (),
                content = new VBox () {
                    margin_start = 20,
                    margin_end = 20,
                    content = {
                        new HBox () {
                            content = {
                                new Label ("Account") {
                                    css_classes = { "title-1", "title-bigger" },
                                    halign = Gtk.Align.START,
                                    valign = Gtk.Align.CENTER,
                                }
                            }
                        },
                        new VBox () {
                            content = {
                                new Section () {
                                    header = "Personal Information",
                                    content = {
                                        new Entry ("First Name") {
                                            hexpand = true,
                                        },
                                        new Entry ("Last Name") {
                                            hexpand = true,
                                        }
                                    }
                                },
                                new Section () {
                                    header = "Actions",
                                    content = {
                                        new Entry ("Type your password") {
                                            hexpand = true,
                                        },
                                        new Entry ("Type your password") {
                                            hexpand = true,
                                        },
                                        new Entry ("Type your password") {
                                            hexpand = true,
                                        },
                                    }
                                }
                            }
                        }
                    }
                }
            };
        }
    }
}
