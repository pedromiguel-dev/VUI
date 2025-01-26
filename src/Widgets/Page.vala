namespace Vui {
    public class Widget.Page : Adw.NavigationPage {

        public new string title {
            set; get; default = null;
        }

        public Impl.View[] destination {
            set; get; default = null;
        }

        public Impl.View content {
            set {
                this.destination = value.destination;
                this.set_child (value);
            }
        }

        public Page (string title) {
            this.set_tag (title);
            this.set_title (title);
        }
    }
}
