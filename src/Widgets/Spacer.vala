namespace Vui {
    public abstract class Widget.Separator : Impl.View {
        private Gtk.Separator separator_widget;

        private Separator (Gtk.Orientation orientation) {
            separator_widget = new Gtk.Separator (orientation);
            this.set_widget (separator_widget);
            this.vexpand = true;
        }
    }

    public class Widget.VSpacer : Widget.Separator {
        public VSpacer () {
            base (Gtk.Orientation.VERTICAL);
        }
    }
    public class Widget.HSpacer : Widget.Separator {
        public HSpacer () {
            base (Gtk.Orientation.HORIZONTAL);
        }
    }
}
