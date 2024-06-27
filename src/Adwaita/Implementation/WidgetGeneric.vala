namespace Vui.Impl {
    [GenericAccessors]
    protected interface Widget<T>{
        public abstract T expand (bool hexpand, bool vexpand);
        public abstract T valign (Gtk.Align align);
        public abstract T halign (Gtk.Align align);
        public abstract T margins (int top, int left, int bottom, int right);
        public abstract T css_classes (string[] css_classes);
        public abstract T height_request (int height);
        public abstract T save (string key, string property, GLib.SettingsBindFlags flag);
    }

    public class Generic<T, G> : Widget<T>, GLib.Object  {
        public static SimpleActionGroup simple_action_group = new SimpleActionGroup();
        public static GLib.Settings gsettings;

        private G _widget;

        private Gtk.Widget internal_widget {
            get { return (Gtk.Widget) _widget; }
        }

        public G widget {
            get { return _widget; }
            set { _widget = value; }
        }

        public T expand (bool hexpand, bool vexpand) {
            internal_widget.set_hexpand (hexpand);
            internal_widget.set_vexpand (vexpand);
            return this;
        }
        public T valign (Gtk.Align align) {
            internal_widget.set_valign (align);
            return this;
        }
        public T halign (Gtk.Align align){
            internal_widget.set_halign (align);
            return this;
        }

        public T margins (int top, int left, int bottom, int right) {
            internal_widget.margin_top = top;
            internal_widget.margin_end = left;
            internal_widget.margin_bottom = bottom;
            internal_widget.margin_start = right;
            return this;
        }

        public T css_classes (string[] css_classes) {
            foreach(var item in css_classes){
                internal_widget.add_css_class (item);
            }
            return this;
        }

        public T height_request (int height) {
            internal_widget.height_request = height;
            return this;
        }

        public T save (string key, string property, GLib.SettingsBindFlags flag) {
            Vui.Impl.Generic.gsettings.bind (key, this.internal_widget, property, flag);
            return this;
        }
    }
}
