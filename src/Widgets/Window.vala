namespace Vui {
    public class Widget.Window : Adw.ApplicationWindow {

        public new Gtk.Widget content {
            set {
                this.set_content (value);
            }
        }

        public Window handle () {
            var handle = new Gtk.WindowHandle ();
            handle.child = this.child;
            this.set_child (handle);

            return this;
        }

        public Window (owned Adw.Application app) {
            Object (application: app);
            save ("width", this, "default-width", SettingsBindFlags.DEFAULT);
            save ("height", this, "default-height", SettingsBindFlags.DEFAULT);
        }
    }
}
