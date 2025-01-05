namespace Vui.Widget {

    public struct AlertDialogAction {
        string name;
        Adw.ResponseAppearance style;
    }

    public class AlertDialog : Vui.Impl.Generic<Adw.AlertDialog> {

        protected delegate void OnResponse (string response);

        public unowned OnResponse? on_response {
            set {
                this.widget.response.connect ((res) => value (res));
            }
        }

        public AlertDialogAction action {
            set {
                widget.add_response (value.name.ascii_down (), value.name);
                widget.set_response_appearance (value.name.ascii_down (), value.style);
            }
        }

        public string action_default {
            set {
                widget.add_response (value.ascii_down (), value);
                widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.DEFAULT);
            }
        }

        public string action_suggested {
            set {
                widget.add_response (value.ascii_down (), value);
                widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.SUGGESTED);
            }
        }
        public string action_destructive {
            set {
                widget.add_response (value.ascii_down (), value);
                widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.DESTRUCTIVE);
            }
        }

        public Vui.Impl.Generic content {
            set {
                widget.set_extra_child (value.gtk_widget);
            }
        }

        public AlertDialog (string title, string description) {
            widget = new Adw.AlertDialog (title, description);
            widget.present (Vui.Widget.App.window);
            widget.show ();
        }
    }
}
