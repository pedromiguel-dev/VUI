namespace Vui.Model {
    public class Store<T> : GLib.Object {
        private T _state;

        public T state {
            get { return _state; }
            set {
                changed(value);
                _state = value;
            }
        }

        public signal void changed(T state);

        public Store(T initial_state) {
            state = initial_state;
        }
    }
}

