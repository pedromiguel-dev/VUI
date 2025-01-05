    public class Vui.Widget.HeaderBar : Vui.Impl.Generic<Adw.HeaderBar> {
        public bool show_back_button {
            set{
                widget.show_back_button = value;
			}
        }
        public bool show_title {
            set{
                widget.show_title = value;
			}
        }
        public HeaderBar () {
            widget = new Adw.HeaderBar ();
        }
    }
