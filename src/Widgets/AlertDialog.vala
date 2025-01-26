namespace Vui {

    public class Widget.AlertDialog : Vui.Impl.View {

        private Adw.AlertDialog alertdialog_widget;

        protected delegate void on_response (string response);

        public unowned on_response? response {
            set {
                alertdialog_widget.response.connect ((res) => value (res));
            }
        }

        public string action {
            set {
                alertdialog_widget.add_response (value.ascii_down (), value);
                alertdialog_widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.DEFAULT);
            }
        }

        public string action_suggested {
            set {
                alertdialog_widget.add_response (value.ascii_down (), value);
                alertdialog_widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.SUGGESTED);
            }
        }
        public string action_destructive {
            set {
                alertdialog_widget.add_response (value.ascii_down (), value);
                alertdialog_widget.set_response_appearance (value.ascii_down (), Adw.ResponseAppearance.DESTRUCTIVE);
            }
        }

        public Impl.View content {
            set {
                this.destination = value.destination;
                alertdialog_widget.set_extra_child (value);
            }
        }

        public AlertDialog (string title, string description) {
            alertdialog_widget = new Adw.AlertDialog (title, description);
            alertdialog_widget.present (Vui.Widget.App.window);
        }
    }
}
