using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class LibraryList : ContentPage
	{
        public ObservableCollection<string> LibraryList1 { get; set; }
        public ObservableCollection<string> LibraryList2 { get; set; }
        public ObservableCollection<string> LibraryList3 { get; set; }
        public ObservableCollection<string> LibraryList4 { get; set; }

        public LibraryList ()
		{
			InitializeComponent ();

            LibraryList1 = new ObservableCollection<string> { "Reading Oasis" };
            LibraryList2 = new ObservableCollection<string> { "Silent Stacks Society" };
            LibraryList3 = new ObservableCollection<string> { "Bookworm Retreat" };
            LibraryList4 = new ObservableCollection<string> { "Wisdom Vault" };


            LibraryListView1.ItemsSource = LibraryList1;
            LibraryListView2.ItemsSource = LibraryList2;
            LibraryListView3.ItemsSource = LibraryList3;
            LibraryListView4.ItemsSource = LibraryList4;
        }
	}
}