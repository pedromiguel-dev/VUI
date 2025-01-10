public class Vui.Widget.Window : Adw.ApplicationWindow, Vui.Impl.Logistics {

    public override string title { get; set; }

    public override Vui.Impl.Subclass[] destination { get; set; }

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
