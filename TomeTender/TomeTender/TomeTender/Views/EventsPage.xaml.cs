using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class EventsPage : ContentPage
    {
        public ObservableCollection<string> EventList { get; set; }
        public ObservableCollection<string> EventList2 { get; set; }
        public ObservableCollection<string> EventList3 { get; set; }
        public ObservableCollection<string> EventList4 { get; set; }

        public EventsPage()
        {
            InitializeComponent();
            {


                EventList = new ObservableCollection<string> { "Reading Oasis" };
                EventList2 = new ObservableCollection<string> { "Silent Stacks Society" };
                EventList3 = new ObservableCollection<string> { "Bookworm Retreat" };
                EventList4 = new ObservableCollection<string> { "Wisdom Vault" };


                EventListView.ItemsSource = EventList;
                EventListView2.ItemsSource = EventList2;
                EventListView3.ItemsSource = EventList3;
                EventListView4.ItemsSource = EventList4;
            }
        }
    }
}