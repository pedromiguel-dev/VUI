namespace Vui.Impl {

    public abstract class View : Gtk.Widget {

        internal Gee.ArrayList<Gtk.Widget> children = new Gee.ArrayList<Gtk.Widget> ();
        private Gtk.Widget widget_internal;
        public bool can_change = false;

        construct {
            this.set_layout_manager (new Gtk.BinLayout ());
            this.widget_internal = this;
        }

        public override void dispose () {
            foreach (var child in children)
                child.unparent ();
            base.dispose ();
        }

        public Model.Store<T> State<T> (T value) {
            var temp = new Model.Store<T> (value);

            temp.changed.connect_after (() => render ());

            return temp;
        }

        public void render () {
            view = body ();
        }

        public delegate View BodyViewContent ();

        private BodyViewContent _body;
        public BodyViewContent? body {
            get {
                return _body;
            }
            owned set {
                _body = value;
                render ();
            }
        }

        /**
         * This is the main view property used to construct Vui objects.
         *
         */
        public View view {
            get {
                return (View) this.widget_internal;
            }
            set {
                this.destination = value.destination;
                this.title = value.title;
                set_widget (value);
            }
        }

        internal void set_widget (Gtk.Widget widget) {

            if (this.widget_internal != null && this.widget_internal != this)
                this.widget_internal.unparent ();

            this.widget_internal = widget;
            this.set_halign (this.widget_internal.halign);
            this.set_valign (this.widget_internal.valign);
            this.set_hexpand (this.widget_internal.hexpand);
            this.set_vexpand (this.widget_internal.vexpand);
            this.widget_internal.set_parent (this);
        }

        internal void set_wrapped_widget (Gtk.Widget widget) {
            this.widget_internal = widget;
        }

        internal void set_child (Gtk.Widget widget) {
            widget.set_parent (this);
            this.children.add (widget);
        }

        public new void add_css_class (string css_class) {
            widget_internal.add_css_class (css_class);
        }

        public string title;

        private View[] _destination = {};
        public View[] destination {
            get {
                return _destination;
            }
            owned set {
                _destination = value;
            }
        }

        /**
         * Expand sets the vexpand and hexpand respectively.
         *
         *
         */
        public bool[] expand {
            set {
                if (value.length == 0) {
                    this.vexpand = true;
                    this.hexpand = true;
                } else if (value.length == 1) {
                    this.vexpand = value[0];
                    this.hexpand = value[0];
                } else {
                    this.vexpand = value[0];
                    this.hexpand = value[1];
                }
            }
        }

        /**
         * Margin sets the [margin_top, margin_bottom, margin_start, margin_end] in this order.
         *
         */
        public int[] margin {
            set {
                if (value.length == 1) {
                    this.margin_top = value[0];
                    this.margin_bottom = value[0];
                    this.margin_start = value[0];
                    this.margin_end = value[0];
                } else if (value.length == 4) {
                    this.margin_top = value[0];
                    this.margin_bottom = value[1];
                    this.margin_start = value[2];
                    this.margin_end = value[3];
                }
            }
        }

        /**
         * Align sets the valign and halign respectively.
         *
         */
        public Gtk.Align[] align {
            set {
                if (value.length == 1) {
                    this.valign = value[0];
                    this.halign = value[0];
                } else if (value.length == 2) {
                    this.valign = value[0];
                    this.halign = value[1];
                }
            }
        }

        /**
         * Whether to expand vertically.
         *
         */
        public new bool vexpand {
            get { return widget_internal.get_vexpand (); }
            set {
                this.set_vexpand (value);
                widget_internal.set_vexpand (value);
            }
        }

        /**
         * Whether to expand horizontally.
         *
         */
        public new bool hexpand {
            get { return widget_internal.get_hexpand (); }
            set {
                this.set_hexpand (value);
                widget_internal.set_hexpand (value);
            }
        }

        /**
         * How to distribute vertical space if widget gets extra space.
         *
         */
        public new Gtk.Align valign {
            get { return widget_internal.valign; }
            set {
                this.set_valign (value);
                widget_internal.set_valign (value);
            }
        }

        /**
         * How to distribute horizontal space if widget gets extra space.
         *
         */
        public new Gtk.Align halign {
            get { return widget_internal.halign; }
            set {
                this.set_halign (value);
                widget_internal.set_halign (value);
            }
        }

        /**
         * Margin on top side of widget.
         *
         */
        public new int margin_top {
            get { return widget_internal.margin_top; }
            set { widget_internal.margin_top = value; }
        }

        /**
         * Margin on left side of widget.
         *
         */
        public new int margin_start {
            get { return widget_internal.margin_start; }
            set { widget_internal.margin_start = value; }
        }

        /**
         * Margin on bottom side of widget.
         *
         */
        public new int margin_bottom {
            get { return widget_internal.margin_bottom; }
            set { widget_internal.margin_bottom = value; }
        }

        /**
         * Margin on right side of widget.
         *
         */
        public new int margin_end {
            get { return widget_internal.margin_end; }
            set { widget_internal.margin_end = value; }
        }

        /**
         * Adds classes to the current style classes of the widget.
         *
         */
        public new string[] css_classes {
            owned get {
                return widget_internal.css_classes;
            }
            set {
                foreach (var class in value) {
                    widget_internal.add_css_class (class);
                }
            }
        }

        /**
         * Whether this widget itself will accept the input focus.
         *
         */
        public new bool focusable {
            get {
                return widget_internal.focusable;
            }
            set {
                widget_internal.focusable = value;
            }
        }
    }
}
