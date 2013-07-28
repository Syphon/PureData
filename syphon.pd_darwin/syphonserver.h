/*
 *  syphon.pd_darwin.h
 *  syphon.pd_darwin
 *
 *  Created by vade on 10/10/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */


#include "Base/GemBase.h"

#import <Cocoa/Cocoa.h>
#import <OpenGL/OpenGL.h>
#import <Syphon/Syphon.h>

// The classes below are exported
#pragma GCC visibility push(default)

class GEM_EXTERN syphonserver : public GemBase
{
	CPPEXTERN_HEADER(syphonserver, GemBase);

public:
	// Constructor
	syphonserver();

	SyphonServer* _server;
	NSString* something;

protected:

	// Rendering 	
	virtual void startRendering();
	virtual void render(GemState *state);
	virtual void postrender(GemState *state){};

	// Stop Transfer
	virtual void stopRendering();
		
};
			
#pragma GCC visibility pop
