
Namespace myapp

#Import "<std>"
#Import "<mojo>"
#Import "<httprequest>"

Using std..
Using mojo..
Using httprequest..

Class MyWindow Extends Window
	
	Field req:HttpRequest

	Method New( title:String="HttpRequest demo",width:Int=640,height:Int=480,flags:WindowFlags=Null )

		Super.New( title,width,height,flags )
		
		req=New HttpRequest
		
		req.Timeout=10

		req.ReadyStateChanged=Lambda()
		
			Print "Ready state changed to "+Int( req.ReadyState )
			
			Select req.ReadyState
			Case ReadyState.Done
				Print "Request done ReponseText=~q"+req.ResponseText+"~q Status="+req.Status
				Print "Length="+req.ResponseText.Length
			Case ReadyState.Error
				Print "Request error Status="+req.Status
			End
		
		End
		
	#If __TARGET__="emscripten"
		Const url:="test.txt"
	#else
		Const url:="https://www.github.com"
	#endif
		
		req.Open( "GET",url )
		
		req.Send()
	End

	Method OnRender( canvas:Canvas ) Override
	
		App.RequestRender()
	
		canvas.DrawText( "Hello World!",Width/2,Height/2,.5,.5 )
	End
	
End

Function Main()

	New AppInstance
	
	New MyWindow
	
	App.Run()
End
