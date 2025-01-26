namespace Vui.Impl {

    public abstract class View : Gtk.Widget {

        internal Gee.ArrayList<Gtk.Widget> children = new Gee.ArrayList<Gtk.Widget> ();
        private Gtk.Widget widget_internal;
        private View[] _destination = {};

        construct {
            this.set_layout_manager (new Gtk.BinLayout ());
            this.widget_internal = this;
        }

        public View view {
            get {
                return (View) this.widget_internal;
            }
            set {
                this.set_halign (value.halign);
                this.set_valign (value.valign);
                this.set_hexpand (value.hexpand);
                this.set_vexpand (value.vexpand);
                this.destination = value.destination;
                this.title = value.title;
                set_widget (value);
            }
        }

        internal void set_widget (Gtk.Widget widget) {
            this.widget_internal = widget;
            widget.set_parent (this);
        }

        internal void set_child (Gtk.Widget widget) {
            widget.set_parent (this);
            this.children.add (widget);
        }

        public new void add_css_class (string css_class) {
            widget_internal.add_css_class (css_class);
        }

        public string title;

        public View[] destination {
            get {
                return _destination;
            }
            owned set {
                _destination = value;
            }
        }

        public new bool vexpand {
            get { return widget_internal.get_vexpand (); }
            set {
                widget_internal.set_vexpand (value);
                this.set_vexpand (value);
            }
        }

        public new bool hexpand {
            get { return widget_internal.get_hexpand (); }
            set {
                widget_internal.set_hexpand (value);
                this.set_hexpand (value);
            }
        }

        public new Gtk.Align valign {
            get { return widget_internal.valign; }
            set {
                this.set_valign (value);
                widget_internal.set_valign (value);
            }
        }

        public new Gtk.Align halign {
            get { return widget_internal.halign; }
            set {
                this.set_valign (value);
                widget_internal.set_halign (value);
            }
        }

        public new int margin_top {
            get { return widget_internal.margin_top; }
            set { widget_internal.margin_top = value; }
        }

        public new int margin_start {
            get { return widget_internal.margin_start; }
            set { widget_internal.margin_start = value; }
        }

        public new int margin_bottom {
            get { return widget_internal.margin_bottom; }
            set { widget_internal.margin_bottom = value; }
        }

        public new int margin_end {
            get { return widget_internal.margin_end; }
            set { widget_internal.margin_end = value; }
        }

        public new string[] css_classes {
            owned get {
                return widget_internal.css_classes;
            }
            set {
                widget_internal.set_css_classes (value);
            }
        }
    }
}
