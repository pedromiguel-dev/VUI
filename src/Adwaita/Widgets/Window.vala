
protected delegate void Vui.Widget.window_handle_callback<T> (T this_);

public class Vui.Widget.Window : Vui.Impl.Generic<Adw.ApplicationWindow> {

    public Vui.Impl.Generic content {
        set {
            widget.set_content (value.gtk_widget);
        }
    }

    public Window (owned Adw.Application app) {
        widget = new Adw.ApplicationWindow (app);
    }

    public Window bind (window_handle_callback<Window?> handle) {
        handle (this);
        return this;
    }

    public Window handle () {
        var handle = new Gtk.WindowHandle ();
        handle.child = this.widget.child;
        widget.set_child (handle);

		save ("width", "default-width", SettingsBindFlags.DEFAULT);
		save ("height", "default-height", SettingsBindFlags.DEFAULT);
        return this;
    }
}
