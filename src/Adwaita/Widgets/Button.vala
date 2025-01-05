public delegate void Vui.Widget.on_click_callback ();

public class Vui.Widget.Button : Vui.Impl.Generic<Gtk.Button> {

    public unowned on_click_callback? on_click {
        set {
            widget.clicked.connect (() => value ());
        }
    }

    public Button () {
        widget = new Gtk.Button ();
    }

    public Button.from_icon_name (string icon_name) {
        widget = new Gtk.Button.from_icon_name (icon_name);
    }
    public Button.with_label (string label) {
        widget = new Gtk.Button.with_label (label);
    }
}
