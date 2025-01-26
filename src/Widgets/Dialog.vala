public class Vui.Widget.Dialog : Vui.Impl.View {

    private Adw.Dialog dialog_widget = new Adw.Dialog () {
        content_width = 600,
        content_height = 550
    };

    public int[] content_size {
        set {
            dialog_widget.content_width = value[0];
            dialog_widget.content_height = value[1];
        }
    }

    public bool follows_content_size {
        set {
            dialog_widget.follows_content_size = value;
        }
    }

    public Impl.View content {
        set {
            dialog_widget.set_child (value);
        }
    }

    public Dialog () {
        dialog_widget.present (Vui.Widget.App.window);
    }
}
