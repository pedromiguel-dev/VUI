namespace Vui.Widget {
    protected delegate void CallbackS (string response);
    public struct AlertDialog : Vui.Impl.Wrap<Adw.AlertDialog, AlertDialog> {

        public AlertDialog on_response (CallbackS action) {
            _widget.response.connect (action);
            return this;
        }

        public AlertDialog add_action (string action, Adw.ResponseAppearance style) {

            _widget.add_response (action.ascii_down(), action);
            _widget.set_response_appearance (action.ascii_down(), style);

            return this;
        }

        public AlertDialog child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> c) {
            _widget.set_extra_child (c.widget);
            return this;
        }

        public AlertDialog (string title, string description) {
            _widget = new Adw.AlertDialog (title, description);
            //_widget.present(Vui.Widget.App._active_window);
            _widget.show();
        }
    }
}
