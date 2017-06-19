
#include "requesters.h"

#include <limits.h>

#include "tinyfiledialogs.h"

void bbRequesters::Notify( bbString title,bbString text,bbBool serious ){

	tinyfd_messageBox( bbCString( title ),bbCString( text ),"ok",serious ? "error" : "info",1 );
}

bbBool bbRequesters::Confirm( bbString title,bbString text,bbBool serious ){

	return tinyfd_messageBox( bbCString( title ),bbCString( text ),"okcancel",serious ? "error" : "info",1 );
}

bbInt bbRequesters::Proceed( bbString title,bbString text,bbBool serious ){

	// Ok, no yesnocancal in tinyfd so we'll use kdialog...

	bbString cmd=BB_T( "kdialog --title \"" )+title+"\" --yesnocancel \""+text+"\"";

	int result=system( cmd.c_str() );
	
	if( result==0 ) return 1;	//YES
	if( result==256 ) return 0;	//NO
	return -1;					//CANCEL
}

bbString bbRequesters::RequestFile( bbString title,bbString exts,bbBool save,bbString path ){

	if( path=="" ) path=".";
		
	return tinyfd_openFileDialog( bbCString( title ),bbCString( path ),0,0,0,0 );
}

bbString bbRequesters::RequestDir( bbString title,bbString dir ){

	if( dir=="" ) dir=".";
		
	return tinyfd_selectFolderDialog( bbCString( title ),bbCString( dir ) );
}

void bbRequesters::OpenUrl( bbString url ){

	system( ( bbString( "xdg-open \"" )+url+"\"" ).c_str() );
}
