namespace Vui.Widget {
    public class Page : Adw.NavigationPage, Vui.Impl.Logistics {

        public override string title {
            set; get; default = null;
        }

        public override Vui.Impl.Subclass[] destination {
            set; get; default = null;
        }

        public Gtk.Widget content {
            set {
                Vui.Impl.BoubleDestination (value, this);
                this.set_child (value);
            }
        }

        public Page (string title) {
            this.set_tag (title);
            this.set_title (title);
        }
    }
}
