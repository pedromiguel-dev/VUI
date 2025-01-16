
public class Vui.Widget.Label : Vui.Impl.Subclass<Gtk.Label> {

    public bool wrap {
        set {
            widget.set_wrap (value);
            widget.set_wrap_mode (Pango.WrapMode.WORD_CHAR);
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

    public Label.ref (Vui.Model.Store<string> state) {
        widget = new Gtk.Label (state.state);
        if (state != null)
            state.changed.connect ((text) => {
                widget.label = text;
            });
        this.child = widget;
    }

    public Label (string label) {
        widget = new Gtk.Label (label);
        this.child = widget;
    }
}
