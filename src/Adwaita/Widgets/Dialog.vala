public class Vui.Widget.Dialog : Vui.Impl.Generic<Adw.Dialog> {

    public int[] content_size {
        set {
            widget.content_width = value[0];
            widget.content_height = value[1];
        }
    }

    public bool follows_content_size {
        set {
            widget.follows_content_size = value;
        }
    }

    public Vui.Impl.Generic content {
        set {
            widget.set_child (value.gtk_widget);
        }
    }

    public Dialog () {
        var content = new VBox ();
        widget = new Adw.Dialog () {
            child = content.gtk_widget,
            content_width = 600,
            content_height = 550
        };
        widget.present (Vui.Widget.App.window);
        widget.show ();
    }
}
