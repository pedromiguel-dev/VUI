namespace Vui.Widget {
    public class HeaderBar : Vui.Impl.Generic<HeaderBar, Adw.HeaderBar> {
        public HeaderBar show_back_button (bool show_back_button) {
            widget.show_back_button = show_back_button;
            return this;
        }

        public HeaderBar show_title (bool show_title) {
            widget.show_title = show_title;
            return this;
        }

        public HeaderBar () {
            widget = new Adw.HeaderBar ();
        }
    }
}
