/* application.vala
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

namespace Demo {
    public class Application : Vui.Widget.App {

        public Application (string id) {
        		Object (application_id: id, flags: ApplicationFlags.DEFAULT_FLAGS);
			activate.connect(() => { window = Demo.MainWindow (this)._widget;});
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        private void on_about_action () {
            string[] developers = { "Pedro Miguel" };
            var about = new Adw.AboutWindow () {
                transient_for = this.active_window,
                application_name = "vui",
                application_icon = "io.github.pedromigueldev.vui",
                developer_name = "Pedro Miguel",
                version = "0.1.0",
                developers = developers,
                copyright = "© 2024-2025 Pedro Miguel",
            };

            about.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
