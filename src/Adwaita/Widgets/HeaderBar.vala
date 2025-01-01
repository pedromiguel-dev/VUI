namespace Vui.Widget {
    public struct HeaderBar : Vui.Impl.Wrap<Adw.HeaderBar, HeaderBar> {
        public HeaderBar show_back_button (bool show_back_button) {
            _widget.show_back_button = show_back_button;
            return this;
        }

        public HeaderBar show_title (bool show_title) {
            _widget.show_title = show_title;
            return this;
        }

        public HeaderBar () {
            _widget = new Adw.HeaderBar ();
        }
    }
}
