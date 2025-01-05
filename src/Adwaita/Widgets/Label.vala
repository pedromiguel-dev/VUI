protected delegate string Vui.Widget.label_string_callback ();

public class Vui.Widget.Label : Vui.Impl.Generic<Gtk.Label> {

    public unowned label_string_callback? on_update {
        set {
            widget.label = value ();
        }
    }

    public bool wrap {
        set {
            widget.set_wrap (value);
        }
    }

    public int lines {
        set {
            widget.set_lines (value);
        }
    }

    public Pango.EllipsizeMode ellipsize {
        set {
            widget.set_ellipsize (value);
        }
    }

    public Label.ref (/**callback_string ? on_update = null, Vui.Model.Store ? state = null**/) {
        // widget = new Gtk.Label (on_update ());
        // if (state != null)
        // state.changed.connect (() => {
        // widget.label = on_update ();
        // });
    }

    public Label (string label) {
        widget = new Gtk.Label (label);
    }
}
