Namespace chipmunk
#Import "<libc>"
#Import "Chipmunk7/include/*.h"
#Import "<chipmunk/chipmunk.h>"
Extern

'***** File: Chipmunk7/include/chipmunk/chipmunk.h *****

Function cpMessage:Void( condition:CString, file:CString, line:Int, isError:Int, isHardError:Int, message:CString )

'***** File: Chipmunk7/include/chipmunk/chipmunk_types.h *****

Alias cpFloat:Double
Struct MSVC_EVIL_FLOAT_HACK
End
Global INFINITY_HACK:MSVC_EVIL_FLOAT_HACK
Function cpfmax:cpFloat( a:cpFloat, b:cpFloat )
Function cpfmin:cpFloat( a:cpFloat, b:cpFloat )
Function cpfabs:cpFloat( f:cpFloat )
Function cpfclamp:cpFloat( f:cpFloat, min:cpFloat, max:cpFloat )
Function cpfclamp01:cpFloat( f:cpFloat )
Function cpflerp:cpFloat( f1:cpFloat, f2:cpFloat, t:cpFloat )
Function cpflerpconst:cpFloat( f1:cpFloat, f2:cpFloat, d:cpFloat )
Alias cpHashValue:Int
Alias cpCollisionID:Int
Alias cpBool:UByte
Alias cpDataPointer:Void Ptr
Alias cpCollisionType:Int
Alias cpGroup:Int
Alias cpBitmask:UInt
Alias cpTimestamp:UInt
Struct cpVect
	Field x:cpFloat
	Field y:cpFloat
End
Struct cpTransform
	Field a:cpFloat
	Field b:cpFloat
	Field c:cpFloat
	Field d:cpFloat
	Field tx:cpFloat
	Field ty:cpFloat
End
Struct cpMat2x2
	Field a:cpFloat
	Field b:cpFloat
	Field c:cpFloat
	Field d:cpFloat
End

'***** File: Chipmunk7/include/chipmunk/cpVect.h *****

Global cpvzero:cpVect
Function cpv:cpVect( x:cpFloat, y:cpFloat )
Function cpveql:cpBool( v1:cpVect, v2:cpVect )
Function cpvadd:cpVect( v1:cpVect, v2:cpVect )
Function cpvsub:cpVect( v1:cpVect, v2:cpVect )
Function cpvneg:cpVect( v:cpVect )
Function cpvmult:cpVect( v:cpVect, s:cpFloat )
Function cpvdot:cpFloat( v1:cpVect, v2:cpVect )
Function cpvcross:cpFloat( v1:cpVect, v2:cpVect )
Function cpvperp:cpVect( v:cpVect )
Function cpvrperp:cpVect( v:cpVect )
Function cpvproject:cpVect( v1:cpVect, v2:cpVect )
Function cpvforangle:cpVect( a:cpFloat )
Function cpvtoangle:cpFloat( v:cpVect )
Function cpvrotate:cpVect( v1:cpVect, v2:cpVect )
Function cpvunrotate:cpVect( v1:cpVect, v2:cpVect )
Function cpvlengthsq:cpFloat( v:cpVect )
Function cpvlength:cpFloat( v:cpVect )
Function cpvlerp:cpVect( v1:cpVect, v2:cpVect, t:cpFloat )
Function cpvnormalize:cpVect( v:cpVect )
Function cpvslerp:cpVect( v1:cpVect, v2:cpVect, t:cpFloat )
Function cpvslerpconst:cpVect( v1:cpVect, v2:cpVect, a:cpFloat )
Function cpvclamp:cpVect( v:cpVect, len:cpFloat )
Function cpvlerpconst:cpVect( v1:cpVect, v2:cpVect, d:cpFloat )
Function cpvdist:cpFloat( v1:cpVect, v2:cpVect )
Function cpvdistsq:cpFloat( v1:cpVect, v2:cpVect )
Function cpvnear:cpBool( v1:cpVect, v2:cpVect, dist:cpFloat )
Function cpMat2x2New:cpMat2x2( a:cpFloat, b:cpFloat, c:cpFloat, d:cpFloat )
Function cpMat2x2Transform:cpVect( m:cpMat2x2, v:cpVect )

'***** File: Chipmunk7/include/chipmunk/cpBB.h *****

Struct cpBB
	Field l:cpFloat
	Field b:cpFloat
	Field r:cpFloat
	Field t:cpFloat
End
Function cpBBNew:cpBB( l:cpFloat, b:cpFloat, r:cpFloat, t:cpFloat )
Function cpBBNewForExtents:cpBB( c:cpVect, hw:cpFloat, hh:cpFloat )
Function cpBBNewForCircle:cpBB( p:cpVect, r:cpFloat )
Function cpBBIntersects:cpBool( a:cpBB, b:cpBB )
Function cpBBContainsBB:cpBool( bb:cpBB, other:cpBB )
Function cpBBContainsVect:cpBool( bb:cpBB, v:cpVect )
Function cpBBMerge:cpBB( a:cpBB, b:cpBB )
Function cpBBExpand:cpBB( bb:cpBB, v:cpVect )
Function cpBBCenter:cpVect( bb:cpBB )
Function cpBBArea:cpFloat( bb:cpBB )
Function cpBBMergedArea:cpFloat( a:cpBB, b:cpBB )
Function cpBBSegmentQuery:cpFloat( bb:cpBB, a:cpVect, b:cpVect )
Function cpBBIntersectsSegment:cpBool( bb:cpBB, a:cpVect, b:cpVect )
Function cpBBClampVect:cpVect( bb:cpBB, v:cpVect )
Function cpBBWrapVect:cpVect( bb:cpBB, v:cpVect )
Function cpBBOffset:cpBB( bb:cpBB, v:cpVect )

'***** File: Chipmunk7/include/chipmunk/cpTransform.h *****

Global cpTransformIdentity:cpTransform
Function cpTransformNew:cpTransform( a:cpFloat, b:cpFloat, c:cpFloat, d:cpFloat, tx:cpFloat, ty:cpFloat )
Function cpTransformNewTranspose:cpTransform( a:cpFloat, c:cpFloat, tx:cpFloat, b:cpFloat, d:cpFloat, ty:cpFloat )
Function cpTransformInverse:cpTransform( t:cpTransform )
Function cpTransformMult:cpTransform( t1:cpTransform, t2:cpTransform )
Function cpTransformPoint:cpVect( t:cpTransform, p:cpVect )
Function cpTransformVect:cpVect( t:cpTransform, v:cpVect )
Function cpTransformbBB:cpBB( t:cpTransform, bb:cpBB )
Function cpTransformTranslate:cpTransform( translate:cpVect )
Function cpTransformScale:cpTransform( scaleX:cpFloat, scaleY:cpFloat )
Function cpTransformRotate:cpTransform( radians:cpFloat )
Function cpTransformRigid:cpTransform( translate:cpVect, radians:cpFloat )
Function cpTransformRigidInverse:cpTransform( t:cpTransform )
Function cpTransformWrap:cpTransform( outer:cpTransform, inner:cpTransform )
Function cpTransformWrapInverse:cpTransform( outer:cpTransform, inner:cpTransform )
Function cpTransformOrtho:cpTransform( bb:cpBB )
Function cpTransformBoneScale:cpTransform( v0:cpVect, v1:cpVect )
Function cpTransformAxialScale:cpTransform( axis:cpVect, pivot:cpVect, scale:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpSpatialIndex.h *****

Alias cpSpatialIndexBBFunc:cpBB( Void Ptr ) 
Alias cpSpatialIndexIteratorFunc:Void( Void Ptr, Void Ptr ) 
Alias cpSpatialIndexQueryFunc:Int( Void Ptr, Void Ptr, cpCollisionID, Void Ptr ) 
Alias cpSpatialIndexSegmentQueryFunc:Double( Void Ptr, Void Ptr, Void Ptr ) 
Struct cpSpatialIndex
	Field klass:cpSpatialIndexClass Ptr
	Field bbfunc:cpSpatialIndexBBFunc
	Field staticIndex:cpSpatialIndex Ptr
	Field dynamicIndex:cpSpatialIndex Ptr
End
Function cpSpaceHashAlloc:cpSpaceHash Ptr(  )
Function cpSpaceHashInit:cpSpatialIndex Ptr( hash:cpSpaceHash Ptr, celldim:cpFloat, numcells:Int, bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Function cpSpaceHashNew:cpSpatialIndex Ptr( celldim:cpFloat, cells:Int, bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Function cpSpaceHashResize:Void( hash:cpSpaceHash Ptr, celldim:cpFloat, numcells:Int )
Function cpBBTreeAlloc:cpBBTree Ptr(  )
Function cpBBTreeInit:cpSpatialIndex Ptr( tree:cpBBTree Ptr, bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Function cpBBTreeNew:cpSpatialIndex Ptr( bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Function cpBBTreeOptimize:Void( index:cpSpatialIndex Ptr )
Alias cpBBTreeVelocityFunc:cpVect( Void Ptr ) 
Function cpBBTreeSetVelocityFunc:Void( index:cpSpatialIndex Ptr, func:cpBBTreeVelocityFunc )
Function cpSweep1DAlloc:cpSweep1D Ptr(  )
Function cpSweep1DInit:cpSpatialIndex Ptr( sweep:cpSweep1D Ptr, bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Function cpSweep1DNew:cpSpatialIndex Ptr( bbfunc:cpSpatialIndexBBFunc, staticIndex:cpSpatialIndex Ptr )
Alias cpSpatialIndexDestroyImpl:Void( cpSpatialIndex Ptr ) 
Alias cpSpatialIndexCountImpl:Int( cpSpatialIndex Ptr ) 
Alias cpSpatialIndexEachImpl:Void( cpSpatialIndex Ptr, cpSpatialIndexIteratorFunc, Void Ptr ) 
Alias cpSpatialIndexContainsImpl:UByte( cpSpatialIndex Ptr, Void Ptr, cpHashValue ) 
Alias cpSpatialIndexInsertImpl:Void( cpSpatialIndex Ptr, Void Ptr, cpHashValue ) 
Alias cpSpatialIndexRemoveImpl:Void( cpSpatialIndex Ptr, Void Ptr, cpHashValue ) 
Alias cpSpatialIndexReindexImpl:Void( cpSpatialIndex Ptr ) 
Alias cpSpatialIndexReindexObjectImpl:Void( cpSpatialIndex Ptr, Void Ptr, cpHashValue ) 
Alias cpSpatialIndexReindexQueryImpl:Void( cpSpatialIndex Ptr, cpSpatialIndexQueryFunc, Void Ptr ) 
Alias cpSpatialIndexQueryImpl:Void( cpSpatialIndex Ptr, Void Ptr, cpBB, cpSpatialIndexQueryFunc, Void Ptr ) 
Alias cpSpatialIndexSegmentQueryImpl:Void( cpSpatialIndex Ptr, Void Ptr, cpVect, cpVect, cpFloat, cpSpatialIndexSegmentQueryFunc, Void Ptr ) 
Struct cpSpatialIndexClass
	Field destroy:cpSpatialIndexDestroyImpl
	Field count:cpSpatialIndexCountImpl
	Field each:cpSpatialIndexEachImpl
	Field contains:cpSpatialIndexContainsImpl
	Field insert:cpSpatialIndexInsertImpl
	Field remove:cpSpatialIndexRemoveImpl
	Field reindex:cpSpatialIndexReindexImpl
	Field reindexObject:cpSpatialIndexReindexObjectImpl
	Field reindexQuery:cpSpatialIndexReindexQueryImpl
	Field query:cpSpatialIndexQueryImpl
	Field segmentQuery:cpSpatialIndexSegmentQueryImpl
End
Function cpSpatialIndexFree:Void( index:cpSpatialIndex Ptr )
Function cpSpatialIndexCollideStatic:Void( dynamicIndex:cpSpatialIndex Ptr, staticIndex:cpSpatialIndex Ptr, func:cpSpatialIndexQueryFunc, data:Void Ptr )
Function cpSpatialIndexDestroy:Void( index:cpSpatialIndex Ptr )
Function cpSpatialIndexCount:Int( index:cpSpatialIndex Ptr )
Function cpSpatialIndexEach:Void( index:cpSpatialIndex Ptr, func:cpSpatialIndexIteratorFunc, data:Void Ptr )
Function cpSpatialIndexContains:cpBool( index:cpSpatialIndex Ptr, obj:Void Ptr, hashid:cpHashValue )
Function cpSpatialIndexInsert:Void( index:cpSpatialIndex Ptr, obj:Void Ptr, hashid:cpHashValue )
Function cpSpatialIndexRemove:Void( index:cpSpatialIndex Ptr, obj:Void Ptr, hashid:cpHashValue )
Function cpSpatialIndexReindex:Void( index:cpSpatialIndex Ptr )
Function cpSpatialIndexReindexObject:Void( index:cpSpatialIndex Ptr, obj:Void Ptr, hashid:cpHashValue )
Function cpSpatialIndexQuery:Void( index:cpSpatialIndex Ptr, obj:Void Ptr, bb:cpBB, func:cpSpatialIndexQueryFunc, data:Void Ptr )
Function cpSpatialIndexSegmentQuery:Void( index:cpSpatialIndex Ptr, obj:Void Ptr, a:cpVect, b:cpVect, t_exit:cpFloat, func:cpSpatialIndexSegmentQueryFunc, data:Void Ptr )
Function cpSpatialIndexReindexQuery:Void( index:cpSpatialIndex Ptr, func:cpSpatialIndexQueryFunc, data:Void Ptr )

'***** File: Chipmunk7/include/chipmunk/cpArbiter.h *****

Function cpArbiterGetRestitution:cpFloat( arb:cpArbiter Ptr )
Function cpArbiterSetRestitution:Void( arb:cpArbiter Ptr, restitution:cpFloat )
Function cpArbiterGetFriction:cpFloat( arb:cpArbiter Ptr )
Function cpArbiterSetFriction:Void( arb:cpArbiter Ptr, friction:cpFloat )
Function cpArbiterGetSurfaceVelocity:cpVect( arb:cpArbiter Ptr )
Function cpArbiterSetSurfaceVelocity:Void( arb:cpArbiter Ptr, vr:cpVect )
Function cpArbiterGetUserData:cpDataPointer( arb:cpArbiter Ptr )
Function cpArbiterSetUserData:Void( arb:cpArbiter Ptr, userData:cpDataPointer )
Function cpArbiterTotalImpulse:cpVect( arb:cpArbiter Ptr )
Function cpArbiterTotalKE:cpFloat( arb:cpArbiter Ptr )
Function cpArbiterIgnore:cpBool( arb:cpArbiter Ptr )
Function cpArbiterGetShapes:Void( arb:cpArbiter Ptr, a:cpShape Ptr Ptr, b:cpShape Ptr Ptr )
Function cpArbiterGetBodies:Void( arb:cpArbiter Ptr, a:cpBody Ptr Ptr, b:cpBody Ptr Ptr )
Struct cpContactPointSet
	Field count:Int
	Field normal:cpVect
End
Function cpArbiterGetContactPointSet:cpContactPointSet( arb:cpArbiter Ptr )
Function cpArbiterSetContactPointSet:Void( arb:cpArbiter Ptr, set:cpContactPointSet Ptr )
Function cpArbiterIsFirstContact:cpBool( arb:cpArbiter Ptr )
Function cpArbiterIsRemoval:cpBool( arb:cpArbiter Ptr )
Function cpArbiterGetCount:Int( arb:cpArbiter Ptr )
Function cpArbiterGetNormal:cpVect( arb:cpArbiter Ptr )
Function cpArbiterGetPointA:cpVect( arb:cpArbiter Ptr, i:Int )
Function cpArbiterGetPointB:cpVect( arb:cpArbiter Ptr, i:Int )
Function cpArbiterGetDepth:cpFloat( arb:cpArbiter Ptr, i:Int )
Function cpArbiterCallWildcardBeginA:cpBool( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardBeginB:cpBool( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardPreSolveA:cpBool( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardPreSolveB:cpBool( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardPostSolveA:Void( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardPostSolveB:Void( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardSeparateA:Void( arb:cpArbiter Ptr, space:cpSpace Ptr )
Function cpArbiterCallWildcardSeparateB:Void( arb:cpArbiter Ptr, space:cpSpace Ptr )

'***** File: Chipmunk7/include/chipmunk/cpBody.h *****

Enum cpBodyType
End
Const CP_BODY_TYPE_DYNAMIC:cpBodyType
Const CP_BODY_TYPE_KINEMATIC:cpBodyType
Const CP_BODY_TYPE_STATIC:cpBodyType
Alias cpBodyVelocityFunc:Void( cpBody Ptr, cpVect, cpFloat, cpFloat ) 
Alias cpBodyPositionFunc:Void( cpBody Ptr, cpFloat ) 
Function cpBodyAlloc:cpBody Ptr(  )
Function cpBodyInit:cpBody Ptr( body:cpBody Ptr, mass:cpFloat, moment:cpFloat )
Function cpBodyNew:cpBody Ptr( mass:cpFloat, moment:cpFloat )
Function cpBodyNewKinematic:cpBody Ptr(  )
Function cpBodyNewStatic:cpBody Ptr(  )
Function cpBodyDestroy:Void( body:cpBody Ptr )
Function cpBodyFree:Void( body:cpBody Ptr )
Function cpBodyActivate:Void( body:cpBody Ptr )
Function cpBodyActivateStatic:Void( body:cpBody Ptr, filter:cpShape Ptr )
Function cpBodySleep:Void( body:cpBody Ptr )
Function cpBodySleepWithGroup:Void( body:cpBody Ptr, group:cpBody Ptr )
Function cpBodyIsSleeping:cpBool( body:cpBody Ptr )
Function cpBodyGetType:cpBodyType( body:cpBody Ptr )
Function cpBodySetType:Void( body:cpBody Ptr, type:cpBodyType )
Function cpBodyGetSpace:cpSpace Ptr( body:cpBody Ptr )
Function cpBodyGetMass:cpFloat( body:cpBody Ptr )
Function cpBodySetMass:Void( body:cpBody Ptr, m:cpFloat )
Function cpBodyGetMoment:cpFloat( body:cpBody Ptr )
Function cpBodySetMoment:Void( body:cpBody Ptr, i:cpFloat )
Function cpBodyGetPosition:cpVect( body:cpBody Ptr )
Function cpBodySetPosition:Void( body:cpBody Ptr, pos:cpVect )
Function cpBodyGetCenterOfGravity:cpVect( body:cpBody Ptr )
Function cpBodySetCenterOfGravity:Void( body:cpBody Ptr, cog:cpVect )
Function cpBodyGetVelocity:cpVect( body:cpBody Ptr )
Function cpBodySetVelocity:Void( body:cpBody Ptr, velocity:cpVect )
Function cpBodyGetForce:cpVect( body:cpBody Ptr )
Function cpBodySetForce:Void( body:cpBody Ptr, force:cpVect )
Function cpBodyGetAngle:cpFloat( body:cpBody Ptr )
Function cpBodySetAngle:Void( body:cpBody Ptr, a:cpFloat )
Function cpBodyGetAngularVelocity:cpFloat( body:cpBody Ptr )
Function cpBodySetAngularVelocity:Void( body:cpBody Ptr, angularVelocity:cpFloat )
Function cpBodyGetTorque:cpFloat( body:cpBody Ptr )
Function cpBodySetTorque:Void( body:cpBody Ptr, torque:cpFloat )
Function cpBodyGetRotation:cpVect( body:cpBody Ptr )
Function cpBodyGetUserData:cpDataPointer( body:cpBody Ptr )
Function cpBodySetUserData:Void( body:cpBody Ptr, userData:cpDataPointer )
Function cpBodySetVelocityUpdateFunc:Void( body:cpBody Ptr, velocityFunc:cpBodyVelocityFunc )
Function cpBodySetPositionUpdateFunc:Void( body:cpBody Ptr, positionFunc:cpBodyPositionFunc )
Function cpBodyUpdateVelocity:Void( body:cpBody Ptr, gravity:cpVect, damping:cpFloat, dt:cpFloat )
Function cpBodyUpdatePosition:Void( body:cpBody Ptr, dt:cpFloat )
Function cpBodyLocalToWorld:cpVect( body:cpBody Ptr, point:cpVect )
Function cpBodyWorldToLocal:cpVect( body:cpBody Ptr, point:cpVect )
Function cpBodyApplyForceAtWorldPoint:Void( body:cpBody Ptr, force:cpVect, point:cpVect )
Function cpBodyApplyForceAtLocalPoint:Void( body:cpBody Ptr, force:cpVect, point:cpVect )
Function cpBodyApplyImpulseAtWorldPoint:Void( body:cpBody Ptr, impulse:cpVect, point:cpVect )
Function cpBodyApplyImpulseAtLocalPoint:Void( body:cpBody Ptr, impulse:cpVect, point:cpVect )
Function cpBodyGetVelocityAtWorldPoint:cpVect( body:cpBody Ptr, point:cpVect )
Function cpBodyGetVelocityAtLocalPoint:cpVect( body:cpBody Ptr, point:cpVect )
Function cpBodyKineticEnergy:cpFloat( body:cpBody Ptr )
Alias cpBodyShapeIteratorFunc:Void( cpBody Ptr, cpShape Ptr, Void Ptr ) 
Function cpBodyEachShape:Void( body:cpBody Ptr, func:cpBodyShapeIteratorFunc, data:Void Ptr )
Alias cpBodyConstraintIteratorFunc:Void( cpBody Ptr, cpConstraint Ptr, Void Ptr ) 
Function cpBodyEachConstraint:Void( body:cpBody Ptr, func:cpBodyConstraintIteratorFunc, data:Void Ptr )
Alias cpBodyArbiterIteratorFunc:Void( cpBody Ptr, cpArbiter Ptr, Void Ptr ) 
Function cpBodyEachArbiter:Void( body:cpBody Ptr, func:cpBodyArbiterIteratorFunc, data:Void Ptr )

'***** File: Chipmunk7/include/chipmunk/cpShape.h *****

Struct cpPointQueryInfo
	Field shape:cpShape Ptr
	Field point:cpVect
	Field distance:cpFloat
	Field gradient:cpVect
End
Struct cpSegmentQueryInfo
	Field shape:cpShape Ptr
	Field point:cpVect
	Field normal:cpVect
	Field alpha:cpFloat
End
Struct cpShapeFilter
	Field group:cpGroup
	Field categories:cpBitmask
	Field mask:cpBitmask
End
Global CP_SHAPE_FILTER_ALL:cpShapeFilter
Global CP_SHAPE_FILTER_NONE:cpShapeFilter
Function cpShapeFilterNew:cpShapeFilter( group:cpGroup, categories:cpBitmask, mask:cpBitmask )
Function cpShapeDestroy:Void( shape:cpShape Ptr )
Function cpShapeFree:Void( shape:cpShape Ptr )
Function cpShapeCacheBB:cpBB( shape:cpShape Ptr )
Function cpShapeUpdate:cpBB( shape:cpShape Ptr, transform:cpTransform )
Function cpShapePointQuery:cpFloat( shape:cpShape Ptr, p:cpVect, out:cpPointQueryInfo Ptr )
Function cpShapeSegmentQuery:cpBool( shape:cpShape Ptr, a:cpVect, b:cpVect, radius:cpFloat, info:cpSegmentQueryInfo Ptr )
Function cpShapesCollide:cpContactPointSet( a:cpShape Ptr, b:cpShape Ptr )
Function cpShapeGetSpace:cpSpace Ptr( shape:cpShape Ptr )
Function cpShapeGetBody:cpBody Ptr( shape:cpShape Ptr )
Function cpShapeSetBody:Void( shape:cpShape Ptr, body:cpBody Ptr )
Function cpShapeGetMass:cpFloat( shape:cpShape Ptr )
Function cpShapeSetMass:Void( shape:cpShape Ptr, mass:cpFloat )
Function cpShapeGetDensity:cpFloat( shape:cpShape Ptr )
Function cpShapeSetDensity:Void( shape:cpShape Ptr, density:cpFloat )
Function cpShapeGetMoment:cpFloat( shape:cpShape Ptr )
Function cpShapeGetArea:cpFloat( shape:cpShape Ptr )
Function cpShapeGetCenterOfGravity:cpVect( shape:cpShape Ptr )
Function cpShapeGetBB:cpBB( shape:cpShape Ptr )
Function cpShapeGetSensor:cpBool( shape:cpShape Ptr )
Function cpShapeSetSensor:Void( shape:cpShape Ptr, sensor:cpBool )
Function cpShapeGetElasticity:cpFloat( shape:cpShape Ptr )
Function cpShapeSetElasticity:Void( shape:cpShape Ptr, elasticity:cpFloat )
Function cpShapeGetFriction:cpFloat( shape:cpShape Ptr )
Function cpShapeSetFriction:Void( shape:cpShape Ptr, friction:cpFloat )
Function cpShapeGetSurfaceVelocity:cpVect( shape:cpShape Ptr )
Function cpShapeSetSurfaceVelocity:Void( shape:cpShape Ptr, surfaceVelocity:cpVect )
Function cpShapeGetUserData:cpDataPointer( shape:cpShape Ptr )
Function cpShapeSetUserData:Void( shape:cpShape Ptr, userData:cpDataPointer )
Function cpShapeGetCollisionType:cpCollisionType( shape:cpShape Ptr )
Function cpShapeSetCollisionType:Void( shape:cpShape Ptr, collisionType:cpCollisionType )
Function cpShapeGetFilter:cpShapeFilter( shape:cpShape Ptr )
Function cpShapeSetFilter:Void( shape:cpShape Ptr, filter:cpShapeFilter )
Function cpCircleShapeAlloc:cpCircleShape Ptr(  )
Function cpCircleShapeInit:cpCircleShape Ptr( circle:cpCircleShape Ptr, body:cpBody Ptr, radius:cpFloat, offset:cpVect )
Function cpCircleShapeNew:cpShape Ptr( body:cpBody Ptr, radius:cpFloat, offset:cpVect )
Function cpCircleShapeGetOffset:cpVect( shape:cpShape Ptr )
Function cpCircleShapeGetRadius:cpFloat( shape:cpShape Ptr )
Function cpSegmentShapeAlloc:cpSegmentShape Ptr(  )
Function cpSegmentShapeInit:cpSegmentShape Ptr( seg:cpSegmentShape Ptr, body:cpBody Ptr, a:cpVect, b:cpVect, radius:cpFloat )
Function cpSegmentShapeNew:cpShape Ptr( body:cpBody Ptr, a:cpVect, b:cpVect, radius:cpFloat )
Function cpSegmentShapeSetNeighbors:Void( shape:cpShape Ptr, prev:cpVect, next_:cpVect )
Function cpSegmentShapeGetA:cpVect( shape:cpShape Ptr )
Function cpSegmentShapeGetB:cpVect( shape:cpShape Ptr )
Function cpSegmentShapeGetNormal:cpVect( shape:cpShape Ptr )
Function cpSegmentShapeGetRadius:cpFloat( shape:cpShape Ptr )

'***** File: Chipmunk7/include/chipmunk/cpPolyShape.h *****

Function cpPolyShapeAlloc:cpPolyShape Ptr(  )
Function cpPolyShapeInit:cpPolyShape Ptr( poly:cpPolyShape Ptr, body:cpBody Ptr, count:Int, verts:cpVect Ptr, transform:cpTransform, radius:cpFloat )
Function cpPolyShapeInitRaw:cpPolyShape Ptr( poly:cpPolyShape Ptr, body:cpBody Ptr, count:Int, verts:cpVect Ptr, radius:cpFloat )
Function cpPolyShapeNew:cpShape Ptr( body:cpBody Ptr, count:Int, verts:cpVect Ptr, transform:cpTransform, radius:cpFloat )
Function cpPolyShapeNewRaw:cpShape Ptr( body:cpBody Ptr, count:Int, verts:cpVect Ptr, radius:cpFloat )
Function cpBoxShapeInit:cpPolyShape Ptr( poly:cpPolyShape Ptr, body:cpBody Ptr, width:cpFloat, height:cpFloat, radius:cpFloat )
Function cpBoxShapeInit2:cpPolyShape Ptr( poly:cpPolyShape Ptr, body:cpBody Ptr, box:cpBB, radius:cpFloat )
Function cpBoxShapeNew:cpShape Ptr( body:cpBody Ptr, width:cpFloat, height:cpFloat, radius:cpFloat )
Function cpBoxShapeNew2:cpShape Ptr( body:cpBody Ptr, box:cpBB, radius:cpFloat )
Function cpPolyShapeGetCount:Int( shape:cpShape Ptr )
Function cpPolyShapeGetVert:cpVect( shape:cpShape Ptr, index:Int )
Function cpPolyShapeGetRadius:cpFloat( shape:cpShape Ptr )

'***** File: Chipmunk7/include/chipmunk/cpConstraint.h *****

Alias cpConstraintPreSolveFunc:Void( cpConstraint Ptr, cpSpace Ptr ) 
Alias cpConstraintPostSolveFunc:Void( cpConstraint Ptr, cpSpace Ptr ) 
Function cpConstraintDestroy:Void( constraint:cpConstraint Ptr )
Function cpConstraintFree:Void( constraint:cpConstraint Ptr )
Function cpConstraintGetSpace:cpSpace Ptr( constraint:cpConstraint Ptr )
Function cpConstraintGetBodyA:cpBody Ptr( constraint:cpConstraint Ptr )
Function cpConstraintGetBodyB:cpBody Ptr( constraint:cpConstraint Ptr )
Function cpConstraintGetMaxForce:cpFloat( constraint:cpConstraint Ptr )
Function cpConstraintSetMaxForce:Void( constraint:cpConstraint Ptr, maxForce:cpFloat )
Function cpConstraintGetErrorBias:cpFloat( constraint:cpConstraint Ptr )
Function cpConstraintSetErrorBias:Void( constraint:cpConstraint Ptr, errorBias:cpFloat )
Function cpConstraintGetMaxBias:cpFloat( constraint:cpConstraint Ptr )
Function cpConstraintSetMaxBias:Void( constraint:cpConstraint Ptr, maxBias:cpFloat )
Function cpConstraintGetCollideBodies:cpBool( constraint:cpConstraint Ptr )
Function cpConstraintSetCollideBodies:Void( constraint:cpConstraint Ptr, collideBodies:cpBool )
Function cpConstraintGetPreSolveFunc:cpConstraintPreSolveFunc( constraint:cpConstraint Ptr )
Function cpConstraintSetPreSolveFunc:Void( constraint:cpConstraint Ptr, preSolveFunc:cpConstraintPreSolveFunc )
Function cpConstraintGetPostSolveFunc:cpConstraintPostSolveFunc( constraint:cpConstraint Ptr )
Function cpConstraintSetPostSolveFunc:Void( constraint:cpConstraint Ptr, postSolveFunc:cpConstraintPostSolveFunc )
Function cpConstraintGetUserData:cpDataPointer( constraint:cpConstraint Ptr )
Function cpConstraintSetUserData:Void( constraint:cpConstraint Ptr, userData:cpDataPointer )
Function cpConstraintGetImpulse:cpFloat( constraint:cpConstraint Ptr )

'***** File: Chipmunk7/include/chipmunk/cpPinJoint.h *****

Function cpConstraintIsPinJoint:cpBool( constraint:cpConstraint Ptr )
Function cpPinJointAlloc:cpPinJoint Ptr(  )
Function cpPinJointInit:cpPinJoint Ptr( joint:cpPinJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect )
Function cpPinJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect )
Function cpPinJointGetAnchorA:cpVect( constraint:cpConstraint Ptr )
Function cpPinJointSetAnchorA:Void( constraint:cpConstraint Ptr, anchorA:cpVect )
Function cpPinJointGetAnchorB:cpVect( constraint:cpConstraint Ptr )
Function cpPinJointSetAnchorB:Void( constraint:cpConstraint Ptr, anchorB:cpVect )
Function cpPinJointGetDist:cpFloat( constraint:cpConstraint Ptr )
Function cpPinJointSetDist:Void( constraint:cpConstraint Ptr, dist:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpSlideJoint.h *****

Function cpConstraintIsSlideJoint:cpBool( constraint:cpConstraint Ptr )
Function cpSlideJointAlloc:cpSlideJoint Ptr(  )
Function cpSlideJointInit:cpSlideJoint Ptr( joint:cpSlideJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect, min:cpFloat, max:cpFloat )
Function cpSlideJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect, min:cpFloat, max:cpFloat )
Function cpSlideJointGetAnchorA:cpVect( constraint:cpConstraint Ptr )
Function cpSlideJointSetAnchorA:Void( constraint:cpConstraint Ptr, anchorA:cpVect )
Function cpSlideJointGetAnchorB:cpVect( constraint:cpConstraint Ptr )
Function cpSlideJointSetAnchorB:Void( constraint:cpConstraint Ptr, anchorB:cpVect )
Function cpSlideJointGetMin:cpFloat( constraint:cpConstraint Ptr )
Function cpSlideJointSetMin:Void( constraint:cpConstraint Ptr, min:cpFloat )
Function cpSlideJointGetMax:cpFloat( constraint:cpConstraint Ptr )
Function cpSlideJointSetMax:Void( constraint:cpConstraint Ptr, max:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpPivotJoint.h *****

Function cpConstraintIsPivotJoint:cpBool( constraint:cpConstraint Ptr )
Function cpPivotJointAlloc:cpPivotJoint Ptr(  )
Function cpPivotJointInit:cpPivotJoint Ptr( joint:cpPivotJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect )
Function cpPivotJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, pivot:cpVect )
Function cpPivotJointNew2:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect )
Function cpPivotJointGetAnchorA:cpVect( constraint:cpConstraint Ptr )
Function cpPivotJointSetAnchorA:Void( constraint:cpConstraint Ptr, anchorA:cpVect )
Function cpPivotJointGetAnchorB:cpVect( constraint:cpConstraint Ptr )
Function cpPivotJointSetAnchorB:Void( constraint:cpConstraint Ptr, anchorB:cpVect )

'***** File: Chipmunk7/include/chipmunk/cpGrooveJoint.h *****

Function cpConstraintIsGrooveJoint:cpBool( constraint:cpConstraint Ptr )
Function cpGrooveJointAlloc:cpGrooveJoint Ptr(  )
Function cpGrooveJointInit:cpGrooveJoint Ptr( joint:cpGrooveJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, groove_a:cpVect, groove_b:cpVect, anchorB:cpVect )
Function cpGrooveJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, groove_a:cpVect, groove_b:cpVect, anchorB:cpVect )
Function cpGrooveJointGetGrooveA:cpVect( constraint:cpConstraint Ptr )
Function cpGrooveJointSetGrooveA:Void( constraint:cpConstraint Ptr, grooveA:cpVect )
Function cpGrooveJointGetGrooveB:cpVect( constraint:cpConstraint Ptr )
Function cpGrooveJointSetGrooveB:Void( constraint:cpConstraint Ptr, grooveB:cpVect )
Function cpGrooveJointGetAnchorB:cpVect( constraint:cpConstraint Ptr )
Function cpGrooveJointSetAnchorB:Void( constraint:cpConstraint Ptr, anchorB:cpVect )

'***** File: Chipmunk7/include/chipmunk/cpDampedSpring.h *****

Function cpConstraintIsDampedSpring:cpBool( constraint:cpConstraint Ptr )
Alias cpDampedSpringForceFunc:Double( cpConstraint Ptr, cpFloat ) 
Function cpDampedSpringAlloc:cpDampedSpring Ptr(  )
Function cpDampedSpringInit:cpDampedSpring Ptr( joint:cpDampedSpring Ptr, a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect, restLength:cpFloat, stiffness:cpFloat, damping:cpFloat )
Function cpDampedSpringNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, anchorA:cpVect, anchorB:cpVect, restLength:cpFloat, stiffness:cpFloat, damping:cpFloat )
Function cpDampedSpringGetAnchorA:cpVect( constraint:cpConstraint Ptr )
Function cpDampedSpringSetAnchorA:Void( constraint:cpConstraint Ptr, anchorA:cpVect )
Function cpDampedSpringGetAnchorB:cpVect( constraint:cpConstraint Ptr )
Function cpDampedSpringSetAnchorB:Void( constraint:cpConstraint Ptr, anchorB:cpVect )
Function cpDampedSpringGetRestLength:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedSpringSetRestLength:Void( constraint:cpConstraint Ptr, restLength:cpFloat )
Function cpDampedSpringGetStiffness:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedSpringSetStiffness:Void( constraint:cpConstraint Ptr, stiffness:cpFloat )
Function cpDampedSpringGetDamping:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedSpringSetDamping:Void( constraint:cpConstraint Ptr, damping:cpFloat )
Function cpDampedSpringGetSpringForceFunc:cpDampedSpringForceFunc( constraint:cpConstraint Ptr )
Function cpDampedSpringSetSpringForceFunc:Void( constraint:cpConstraint Ptr, springForceFunc:cpDampedSpringForceFunc )

'***** File: Chipmunk7/include/chipmunk/cpDampedRotarySpring.h *****

Function cpConstraintIsDampedRotarySpring:cpBool( constraint:cpConstraint Ptr )
Alias cpDampedRotarySpringTorqueFunc:Double( cpConstraint Ptr, cpFloat ) 
Function cpDampedRotarySpringAlloc:cpDampedRotarySpring Ptr(  )
Function cpDampedRotarySpringInit:cpDampedRotarySpring Ptr( joint:cpDampedRotarySpring Ptr, a:cpBody Ptr, b:cpBody Ptr, restAngle:cpFloat, stiffness:cpFloat, damping:cpFloat )
Function cpDampedRotarySpringNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, restAngle:cpFloat, stiffness:cpFloat, damping:cpFloat )
Function cpDampedRotarySpringGetRestAngle:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedRotarySpringSetRestAngle:Void( constraint:cpConstraint Ptr, restAngle:cpFloat )
Function cpDampedRotarySpringGetStiffness:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedRotarySpringSetStiffness:Void( constraint:cpConstraint Ptr, stiffness:cpFloat )
Function cpDampedRotarySpringGetDamping:cpFloat( constraint:cpConstraint Ptr )
Function cpDampedRotarySpringSetDamping:Void( constraint:cpConstraint Ptr, damping:cpFloat )
Function cpDampedRotarySpringGetSpringTorqueFunc:cpDampedRotarySpringTorqueFunc( constraint:cpConstraint Ptr )
Function cpDampedRotarySpringSetSpringTorqueFunc:Void( constraint:cpConstraint Ptr, springTorqueFunc:cpDampedRotarySpringTorqueFunc )

'***** File: Chipmunk7/include/chipmunk/cpRotaryLimitJoint.h *****

Function cpConstraintIsRotaryLimitJoint:cpBool( constraint:cpConstraint Ptr )
Function cpRotaryLimitJointAlloc:cpRotaryLimitJoint Ptr(  )
Function cpRotaryLimitJointInit:cpRotaryLimitJoint Ptr( joint:cpRotaryLimitJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, min:cpFloat, max:cpFloat )
Function cpRotaryLimitJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, min:cpFloat, max:cpFloat )
Function cpRotaryLimitJointGetMin:cpFloat( constraint:cpConstraint Ptr )
Function cpRotaryLimitJointSetMin:Void( constraint:cpConstraint Ptr, min:cpFloat )
Function cpRotaryLimitJointGetMax:cpFloat( constraint:cpConstraint Ptr )
Function cpRotaryLimitJointSetMax:Void( constraint:cpConstraint Ptr, max:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpRatchetJoint.h *****

Function cpConstraintIsRatchetJoint:cpBool( constraint:cpConstraint Ptr )
Function cpRatchetJointAlloc:cpRatchetJoint Ptr(  )
Function cpRatchetJointInit:cpRatchetJoint Ptr( joint:cpRatchetJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, phase:cpFloat, ratchet:cpFloat )
Function cpRatchetJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, phase:cpFloat, ratchet:cpFloat )
Function cpRatchetJointGetAngle:cpFloat( constraint:cpConstraint Ptr )
Function cpRatchetJointSetAngle:Void( constraint:cpConstraint Ptr, angle:cpFloat )
Function cpRatchetJointGetPhase:cpFloat( constraint:cpConstraint Ptr )
Function cpRatchetJointSetPhase:Void( constraint:cpConstraint Ptr, phase:cpFloat )
Function cpRatchetJointGetRatchet:cpFloat( constraint:cpConstraint Ptr )
Function cpRatchetJointSetRatchet:Void( constraint:cpConstraint Ptr, ratchet:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpGearJoint.h *****

Function cpConstraintIsGearJoint:cpBool( constraint:cpConstraint Ptr )
Function cpGearJointAlloc:cpGearJoint Ptr(  )
Function cpGearJointInit:cpGearJoint Ptr( joint:cpGearJoint Ptr, a:cpBody Ptr, b:cpBody Ptr, phase:cpFloat, ratio:cpFloat )
Function cpGearJointNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, phase:cpFloat, ratio:cpFloat )
Function cpGearJointGetPhase:cpFloat( constraint:cpConstraint Ptr )
Function cpGearJointSetPhase:Void( constraint:cpConstraint Ptr, phase:cpFloat )
Function cpGearJointGetRatio:cpFloat( constraint:cpConstraint Ptr )
Function cpGearJointSetRatio:Void( constraint:cpConstraint Ptr, ratio:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpSimpleMotor.h *****

Function cpConstraintIsSimpleMotor:cpBool( constraint:cpConstraint Ptr )
Function cpSimpleMotorAlloc:cpSimpleMotor Ptr(  )
Function cpSimpleMotorInit:cpSimpleMotor Ptr( joint:cpSimpleMotor Ptr, a:cpBody Ptr, b:cpBody Ptr, rate:cpFloat )
Function cpSimpleMotorNew:cpConstraint Ptr( a:cpBody Ptr, b:cpBody Ptr, rate:cpFloat )
Function cpSimpleMotorGetRate:cpFloat( constraint:cpConstraint Ptr )
Function cpSimpleMotorSetRate:Void( constraint:cpConstraint Ptr, rate:cpFloat )

'***** File: Chipmunk7/include/chipmunk/cpSpace.h *****

Alias cpCollisionBeginFunc:UByte( cpArbiter Ptr, cpSpace Ptr, cpDataPointer ) 
Alias cpCollisionPreSolveFunc:UByte( cpArbiter Ptr, cpSpace Ptr, cpDataPointer ) 
Alias cpCollisionPostSolveFunc:Void( cpArbiter Ptr, cpSpace Ptr, cpDataPointer ) 
Alias cpCollisionSeparateFunc:Void( cpArbiter Ptr, cpSpace Ptr, cpDataPointer ) 
Struct cpCollisionHandler
	Field typeA:cpCollisionType
	Field typeB:cpCollisionType
	Field beginFunc:cpCollisionBeginFunc
	Field preSolveFunc:cpCollisionPreSolveFunc
	Field postSolveFunc:cpCollisionPostSolveFunc
	Field separateFunc:cpCollisionSeparateFunc
	Field userData:cpDataPointer
End
Function cpSpaceAlloc:cpSpace Ptr(  )
Function cpSpaceInit:cpSpace Ptr( space:cpSpace Ptr )
Function cpSpaceNew:cpSpace Ptr(  )
Function cpSpaceDestroy:Void( space:cpSpace Ptr )
Function cpSpaceFree:Void( space:cpSpace Ptr )
Function cpSpaceGetIterations:Int( space:cpSpace Ptr )
Function cpSpaceSetIterations:Void( space:cpSpace Ptr, iterations:Int )
Function cpSpaceGetGravity:cpVect( space:cpSpace Ptr )
Function cpSpaceSetGravity:Void( space:cpSpace Ptr, gravity:cpVect )
Function cpSpaceGetDamping:cpFloat( space:cpSpace Ptr )
Function cpSpaceSetDamping:Void( space:cpSpace Ptr, damping:cpFloat )
Function cpSpaceGetIdleSpeedThreshold:cpFloat( space:cpSpace Ptr )
Function cpSpaceSetIdleSpeedThreshold:Void( space:cpSpace Ptr, idleSpeedThreshold:cpFloat )
Function cpSpaceGetSleepTimeThreshold:cpFloat( space:cpSpace Ptr )
Function cpSpaceSetSleepTimeThreshold:Void( space:cpSpace Ptr, sleepTimeThreshold:cpFloat )
Function cpSpaceGetCollisionSlop:cpFloat( space:cpSpace Ptr )
Function cpSpaceSetCollisionSlop:Void( space:cpSpace Ptr, collisionSlop:cpFloat )
Function cpSpaceGetCollisionBias:cpFloat( space:cpSpace Ptr )
Function cpSpaceSetCollisionBias:Void( space:cpSpace Ptr, collisionBias:cpFloat )
Function cpSpaceGetCollisionPersistence:cpTimestamp( space:cpSpace Ptr )
Function cpSpaceSetCollisionPersistence:Void( space:cpSpace Ptr, collisionPersistence:cpTimestamp )
Function cpSpaceGetUserData:cpDataPointer( space:cpSpace Ptr )
Function cpSpaceSetUserData:Void( space:cpSpace Ptr, userData:cpDataPointer )
Function cpSpaceGetStaticBody:cpBody Ptr( space:cpSpace Ptr )
Function cpSpaceGetCurrentTimeStep:cpFloat( space:cpSpace Ptr )
Function cpSpaceIsLocked:cpBool( space:cpSpace Ptr )
Function cpSpaceAddDefaultCollisionHandler:cpCollisionHandler Ptr( space:cpSpace Ptr )
Function cpSpaceAddCollisionHandler:cpCollisionHandler Ptr( space:cpSpace Ptr, a:cpCollisionType, b:cpCollisionType )
Function cpSpaceAddWildcardHandler:cpCollisionHandler Ptr( space:cpSpace Ptr, type:cpCollisionType )
Function cpSpaceAddShape:cpShape Ptr( space:cpSpace Ptr, shape:cpShape Ptr )
Function cpSpaceAddBody:cpBody Ptr( space:cpSpace Ptr, body:cpBody Ptr )
Function cpSpaceAddConstraint:cpConstraint Ptr( space:cpSpace Ptr, constraint:cpConstraint Ptr )
Function cpSpaceRemoveShape:Void( space:cpSpace Ptr, shape:cpShape Ptr )
Function cpSpaceRemoveBody:Void( space:cpSpace Ptr, body:cpBody Ptr )
Function cpSpaceRemoveConstraint:Void( space:cpSpace Ptr, constraint:cpConstraint Ptr )
Function cpSpaceContainsShape:cpBool( space:cpSpace Ptr, shape:cpShape Ptr )
Function cpSpaceContainsBody:cpBool( space:cpSpace Ptr, body:cpBody Ptr )
Function cpSpaceContainsConstraint:cpBool( space:cpSpace Ptr, constraint:cpConstraint Ptr )
Alias cpPostStepFunc:Void( cpSpace Ptr, Void Ptr, Void Ptr ) 
Function cpSpaceAddPostStepCallback:cpBool( space:cpSpace Ptr, func:cpPostStepFunc, key:Void Ptr, data:Void Ptr )
Alias cpSpacePointQueryFunc:Void( cpShape Ptr, cpVect, cpFloat, cpVect, Void Ptr ) 
Function cpSpacePointQuery:Void( space:cpSpace Ptr, point:cpVect, maxDistance:cpFloat, filter:cpShapeFilter, func:cpSpacePointQueryFunc, data:Void Ptr )
Function cpSpacePointQueryNearest:cpShape Ptr( space:cpSpace Ptr, point:cpVect, maxDistance:cpFloat, filter:cpShapeFilter, out:cpPointQueryInfo Ptr )
Alias cpSpaceSegmentQueryFunc:Void( cpShape Ptr, cpVect, cpVect, cpFloat, Void Ptr ) 
Function cpSpaceSegmentQuery:Void( space:cpSpace Ptr, start:cpVect, end_:cpVect, radius:cpFloat, filter:cpShapeFilter, func:cpSpaceSegmentQueryFunc, data:Void Ptr )
Function cpSpaceSegmentQueryFirst:cpShape Ptr( space:cpSpace Ptr, start:cpVect, end_:cpVect, radius:cpFloat, filter:cpShapeFilter, out:cpSegmentQueryInfo Ptr )
Alias cpSpaceBBQueryFunc:Void( cpShape Ptr, Void Ptr ) 
Function cpSpaceBBQuery:Void( space:cpSpace Ptr, bb:cpBB, filter:cpShapeFilter, func:cpSpaceBBQueryFunc, data:Void Ptr )
Alias cpSpaceShapeQueryFunc:Void( cpShape Ptr, cpContactPointSet Ptr, Void Ptr ) 
Function cpSpaceShapeQuery:cpBool( space:cpSpace Ptr, shape:cpShape Ptr, func:cpSpaceShapeQueryFunc, data:Void Ptr )
Alias cpSpaceBodyIteratorFunc:Void( cpBody Ptr, Void Ptr ) 
Function cpSpaceEachBody:Void( space:cpSpace Ptr, func:cpSpaceBodyIteratorFunc, data:Void Ptr )
Alias cpSpaceShapeIteratorFunc:Void( cpShape Ptr, Void Ptr ) 
Function cpSpaceEachShape:Void( space:cpSpace Ptr, func:cpSpaceShapeIteratorFunc, data:Void Ptr )
Alias cpSpaceConstraintIteratorFunc:Void( cpConstraint Ptr, Void Ptr ) 
Function cpSpaceEachConstraint:Void( space:cpSpace Ptr, func:cpSpaceConstraintIteratorFunc, data:Void Ptr )
Function cpSpaceReindexStatic:Void( space:cpSpace Ptr )
Function cpSpaceReindexShape:Void( space:cpSpace Ptr, shape:cpShape Ptr )
Function cpSpaceReindexShapesForBody:Void( space:cpSpace Ptr, body:cpBody Ptr )
Function cpSpaceUseSpatialHash:Void( space:cpSpace Ptr, dim:cpFloat, count:Int )
Function cpSpaceStep:Void( space:cpSpace Ptr, dt:cpFloat )
Struct cpSpaceDebugColor
	Field r:Float
	Field g:Float
	Field b:Float
	Field a:Float
End
Alias cpSpaceDebugDrawCircleImpl:Void( cpVect, cpFloat, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer ) 
Alias cpSpaceDebugDrawSegmentImpl:Void( cpVect, cpVect, cpSpaceDebugColor, cpDataPointer ) 
Alias cpSpaceDebugDrawFatSegmentImpl:Void( cpVect, cpVect, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer ) 
Alias cpSpaceDebugDrawPolygonImpl:Void( Int, cpVect Ptr, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer ) 
Alias cpSpaceDebugDrawDotImpl:Void( cpFloat, cpVect, cpSpaceDebugColor, cpDataPointer ) 
Alias cpSpaceDebugDrawColorForShapeImpl:cpSpaceDebugColor( cpShape Ptr, cpDataPointer ) 
Enum cpSpaceDebugDrawFlags
End
Const CP_SPACE_DEBUG_DRAW_SHAPES:cpSpaceDebugDrawFlags
Const CP_SPACE_DEBUG_DRAW_CONSTRAINTS:cpSpaceDebugDrawFlags
Const CP_SPACE_DEBUG_DRAW_COLLISION_POINTS:cpSpaceDebugDrawFlags
Struct cpSpaceDebugDrawOptions
	Field drawCircle:cpSpaceDebugDrawCircleImpl
	Field drawSegment:cpSpaceDebugDrawSegmentImpl
	Field drawFatSegment:cpSpaceDebugDrawFatSegmentImpl
	Field drawPolygon:cpSpaceDebugDrawPolygonImpl
	Field drawDot:cpSpaceDebugDrawDotImpl
	Field flags:cpSpaceDebugDrawFlags
	Field shapeOutlineColor:cpSpaceDebugColor
	Field colorForShape:cpSpaceDebugDrawColorForShapeImpl
	Field constraintColor:cpSpaceDebugColor
	Field collisionPointColor:cpSpaceDebugColor
	Field data:cpDataPointer
End
Function cpSpaceDebugDraw:Void( space:cpSpace Ptr, options:cpSpaceDebugDrawOptions Ptr )

'***** File: Chipmunk7/include/chipmunk/chipmunk.h *****

Global cpVersionString:libc.const_char_t Ptr
Function cpMomentForCircle:cpFloat( m:cpFloat, r1:cpFloat, r2:cpFloat, offset:cpVect )
Function cpAreaForCircle:cpFloat( r1:cpFloat, r2:cpFloat )
Function cpMomentForSegment:cpFloat( m:cpFloat, a:cpVect, b:cpVect, radius:cpFloat )
Function cpAreaForSegment:cpFloat( a:cpVect, b:cpVect, radius:cpFloat )
Function cpMomentForPoly:cpFloat( m:cpFloat, count:Int, verts:cpVect Ptr, offset:cpVect, radius:cpFloat )
Function cpAreaForPoly:cpFloat( count:Int, verts:cpVect Ptr, radius:cpFloat )
Function cpCentroidForPoly:cpVect( count:Int, verts:cpVect Ptr )
Function cpMomentForBox:cpFloat( m:cpFloat, width:cpFloat, height:cpFloat )
Function cpMomentForBox2:cpFloat( m:cpFloat, box:cpBB )
Function cpConvexHull:Int( count:Int, verts:cpVect Ptr, result:cpVect Ptr, first:Int Ptr, tol:cpFloat )
Function cpClosetPointOnSegment:cpVect( p:cpVect, a:cpVect, b:cpVect )

'***** Extern Structs *****

Struct cpArbiter
End
Struct cpArray
End
Struct cpBBTree
End
Struct cpBody
End
Struct cpCircleShape
End
Struct cpConstraint
End
Struct cpDampedRotarySpring
End
Struct cpDampedSpring
End
Struct cpGearJoint
End
Struct cpGrooveJoint
End
Struct cpHashSet
End
Struct cpPinJoint
End
Struct cpPivotJoint
End
Struct cpPolyShape
End
Struct cpRatchetJoint
End
Struct cpRotaryLimitJoint
End
Struct cpSegmentShape
End
Struct cpShape
End
Struct cpSimpleMotor
End
Struct cpSimpleMotorJoint
End
Struct cpSlideJoint
End
Struct cpSpace
End
Struct cpSpaceHash
End
Struct cpSweep1D
End