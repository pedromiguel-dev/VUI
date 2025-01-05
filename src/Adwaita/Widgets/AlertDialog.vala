namespace Vui.Widget {
    protected delegate void CallbackS (string response);

    public class AlertDialog : Vui.Impl.Generic<Adw.AlertDialog> {

        public CallbackS on_response {
            set {
                widget.response.connect (value);
            }
        }


        // public AlertDialog add_action (string action, Adw.ResponseAppearance style) {

        // widget.add_response (action.ascii_down (), action);
        // widget.set_response_appearance (action.ascii_down (), style);

        // return this;
        // }


        public Vui.Impl.Generic child {
            set {
                widget.set_extra_child (value.gtk_widget);
            }
        }

        public AlertDialog (string title, string description) {
            widget = new Adw.AlertDialog (title, description);
            // widget.present(Vui.Widget.App._active_window);
            widget.show ();
        }
    }
}
