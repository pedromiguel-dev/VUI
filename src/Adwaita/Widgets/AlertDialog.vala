namespace Vui.Widget {

    public class AlertDialog : Vui.Impl.Subclass<Adw.AlertDialog> {

        protected delegate void on_response (string response);

        public unowned on_response? response {
            set {
                this.widget.response.connect ((res) => value (res));
            }
        }

        public string action {
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

        public Gtk.Widget content {
            set {
                Vui.Impl.BoubleDestination (value, this);
                widget.set_extra_child (value);
            }
        }

        public AlertDialog (string title, string description) {
            widget = new Adw.AlertDialog (title, description);
            widget.present (Vui.Widget.App.window);
        }
    }
}
