/*
 *  syphon.pd_darwin.mm
 *  syphon.pd_darwin
 *
 *  Created by vade on 10/10/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#include "syphonserver.h"

CPPEXTERN_NEW(syphonserver);

syphonserver :: syphonserver()
{		
	_server = nil;
	something = nil;
}

void syphonserver :: startRendering() 
{
	post("SyphonServer: start rendering"); 
	
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

	post("pool is: %p", pool);

	post("context is : %p", CGLGetCurrentContext());
	
	_server = [[SyphonServer alloc] initWithName:nil context:CGLGetCurrentContext() options:nil];
	post("Server is: %p", _server);

	something = [@"OMG" retain];
	post("Server is: %s", [something cStringUsingEncoding:NSASCIIStringEncoding]);
		
	
	[pool drain];	
};

void syphonserver :: render(GemState *state)
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

	GLint dims[4];
	glGetIntegerv(GL_VIEWPORT, dims);
	GLuint worldTexture;
	glEnable(GL_TEXTURE_RECTANGLE_EXT);
	glGenTextures(1, &worldTexture);
	glBindTexture(GL_TEXTURE_RECTANGLE_EXT, worldTexture);
	glTexImage2D(GL_TEXTURE_RECTANGLE_EXT, 0, GL_RGBA8, dims[2], dims[3], 0, GL_RGBA, GL_UNSIGNED_BYTE, NULL);
	glCopyTexSubImage2D(GL_TEXTURE_RECTANGLE_EXT, 0, 0, 0, dims[0], dims[1], dims[2], dims[3]);
	
	if(worldTexture)		
	{
		[_server publishFrameTexture:worldTexture
						textureTarget:GL_TEXTURE_RECTANGLE_EXT
						  imageRegion:(NSRect){{0.0, 0.0}, {dims[2], dims[3]}}
					textureDimensions:(NSSize){dims[2], dims[3]}
							  flipped:NO];
		glDeleteTextures(1, &worldTexture);
	}
	
	
	[pool drain];
}

void syphonserver :: stopRendering()
{
	post("SyphonServer: stop rendering"); 
	
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	[_server stop];
	 
	[_server release];
	_server = nil;
		 
	[pool drain];
};



void syphonserver :: obj_setupCallback(t_class *classPtr)
{
};

