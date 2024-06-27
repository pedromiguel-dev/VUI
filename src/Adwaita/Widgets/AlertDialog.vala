namespace Vui.Widget {
    public class AlertDialog : Vui.Impl.Generic<AlertDialog, Adw.AlertDialog> {
        protected delegate void Action (string response);

        public AlertDialog on_response (Action action) {
            this.widget.response.connect ((res) => action(res));
            return this;
        }

        public AlertDialog add_action (string action, Adw.ResponseAppearance style) {

            this.widget.add_response (action.ascii_down(), action);
            this.widget.set_response_appearance (action.ascii_down(), style);

            return this;
        }

        public AlertDialog child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> c) {
            this.widget.set_extra_child (c.widget);
            return this;
        }

        public AlertDialog (string title, string description) {
            widget = new Adw.AlertDialog (title, description);
            this.widget.present(Vui.Widget.App._active_window_);
            this.widget.show();
        }
    }
}