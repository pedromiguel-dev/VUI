namespace Vui.Impl {

    public struct Wrap<G, T> {
        static SimpleActionGroup _simple_action_group;

		public SimpleActionGroup simple_action_group {
            get { if (_simple_action_group == null) 
                    _simple_action_group = new SimpleActionGroup();
                    return _simple_action_group;
            }
        }
 		public Wrap() {
		}

        public G _widget;

        public Gtk.Widget widget {
            get { return (Gtk.Widget) _widget; }
            set { _widget = value; }
        }
        public bool vexpand {
            get { return widget.get_vexpand(); }
            set { widget.set_vexpand(value); }
        }
        public bool hexpand {
            get { return widget.get_hexpand(); }
            set { widget.set_hexpand(value); }
        }
        public Gtk.Align valign {
            get { return widget.valign; }
            set { widget.set_valign (value); }
        }
        public Gtk.Align halign {
            get { return widget.halign; }
            set { widget.set_halign (value); }
        }

        public int margin_top {
            get { return widget.margin_top ;}
            set { widget.margin_top = value ;}
        }
        public int margin_left {
            get { return widget.margin_start ;}
            set { widget.margin_start = value ;}
        }
        public int margin_bottom {
            get { return widget.margin_bottom ;}
            set { widget.margin_bottom = value ;}
        }
        public int margin_right {
            get { return widget.margin_end ;}
            set { widget.margin_end = value ;}
        }

        public string[] css_classes {
            set {
                foreach(var item in value){
                    widget.add_css_class (item);
                }
            }
        }

        public int height_request {
            get { return widget.height_request; }
            set { widget.height_request = value; }
        }
    }

    public class Generic<T, G> {
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
