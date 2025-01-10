
public class Vui.Widget.Button : Vui.Impl.Subclass<Gtk.Button> {

    public delegate void on_click_callback ();

    public unowned on_click_callback? on_click {
        set {
            widget.clicked.connect (() => value ());
        }
    }

    public Button () {
        widget = new Gtk.Button ();
        this.child = widget;
    }

    public Button.from_icon_name (string icon_name) {
        widget = new Gtk.Button.from_icon_name (icon_name);
        this.child = widget;
    }
    public Button.with_label (string label) {
        widget = new Gtk.Button.with_label (label);
        this.child = widget;
    }
}
