
public class Vui.Widget.HBox : Vui.Impl.Generic<Gtk.Box> {

    public Vui.Impl.Generic[] ? children {
        set {
            if (value != null)
                foreach (var child in value)
                    widget.append (child.gtk_widget);
        }
    }

    public int spacing {
        set {
            widget.set_spacing (value);
        }
    }

    public HBox (Vui.Impl.Generic[] children = {}) {
        widget = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
    }
}

public class Vui.Widget.VBox : Vui.Impl.Generic<Gtk.Box> {

    public Vui.Impl.Generic[] ? children {
        set {
            if (value != null)
                foreach (var child in value)
                    widget.append (child.gtk_widget);
        }
    }

    public int spacing {
        set {
            widget.set_spacing (value);
        }
    }

    public VBox (Vui.Impl.Generic[] children = {}) {
        widget = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

        if (children != null)
            foreach (var child in children)
                widget.append (child.gtk_widget);
    }
}
