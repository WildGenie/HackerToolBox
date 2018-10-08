#pragma  once
//功能：虚拟机加密开始标记
//备注：需要配合结束标记（VP_SDK_VIRTUALIZE_END）使用
#define VP_SDK_VIRTUALIZE_BEGIN \
	__asm __emit 0xEB\
	__asm __emit 0x14\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x56\
	__asm __emit 0x69\
	__asm __emit 0x72\
	__asm __emit 0x74\
	__asm __emit 0x75\
	__asm __emit 0x61\
	__asm __emit 0x6C\
	__asm __emit 0x69\
	__asm __emit 0x7A\
	__asm __emit 0x65\
	__asm __emit 0x5F\
	__asm __emit 0x42\
	__asm __emit 0x65\
	__asm __emit 0x67\
	__asm __emit 0x69\
	__asm __emit 0x6E\
	__asm __emit 0x00;
	
 //功能：虚拟机加密结束标记
//备注：需要配合开始标记（VP_SDK_VIRTUALIZE_BEGIN）使用
#define VP_SDK_VIRTUALIZE_END \
	__asm __emit 0xEB\
	__asm __emit 0x12\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x56\
	__asm __emit 0x69\
	__asm __emit 0x72\
	__asm __emit 0x74\
	__asm __emit 0x75\
	__asm __emit 0x61\
	__asm __emit 0x6C\
	__asm __emit 0x69\
	__asm __emit 0x7A\
	__asm __emit 0x65\
	__asm __emit 0x5F\
	__asm __emit 0x45\
	__asm __emit 0x6E\
	__asm __emit 0x64\
	__asm __emit 0x00;
	
 //功能：乱序加密开始标记
//备注：需要配合结束标记（VP_SDK_MUTATION_END）使用
#define VP_SDK_MUTATION_BEGIN \
	__asm __emit 0xEB\
	__asm __emit 0x12\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x4D\
	__asm __emit 0x75\
	__asm __emit 0x74\
	__asm __emit 0x61\
	__asm __emit 0x74\
	__asm __emit 0x69\
	__asm __emit 0x6F\
	__asm __emit 0x6E\
	__asm __emit 0x5F\
	__asm __emit 0x42\
	__asm __emit 0x65\
	__asm __emit 0x67\
	__asm __emit 0x69\
	__asm __emit 0x6E\
	__asm __emit 0x00;
	
 //功能：乱序加密结束标记
//备注：需要配合开始标记（VP_SDK_MUTATION_BEGIN）使用
#define VP_SDK_MUTATION_END \
	__asm __emit 0xEB\
	__asm __emit 0x10\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x4D\
	__asm __emit 0x75\
	__asm __emit 0x74\
	__asm __emit 0x61\
	__asm __emit 0x74\
	__asm __emit 0x69\
	__asm __emit 0x6F\
	__asm __emit 0x6E\
	__asm __emit 0x5F\
	__asm __emit 0x45\
	__asm __emit 0x6E\
	__asm __emit 0x64\
	__asm __emit 0x00;
	
//功能：虚拟机加密标记
//备注：不需要结束标记，程序会自动定位函数结尾
#define VP_SDK_VIRTUALIZE \
	__asm __emit 0xEB\
	__asm __emit 0x0B\
	__asm __emit 0x56\
	__asm __emit 0x69\
	__asm __emit 0x72\
	__asm __emit 0x74\
	__asm __emit 0x75\
	__asm __emit 0x61\
	__asm __emit 0x6C\
	__asm __emit 0x69\
	__asm __emit 0x7A\
	__asm __emit 0x65\
	__asm __emit 0x00;

//功能：深度虚拟机加密标记
//备注：不需要结束标记，程序会自动定位函数结尾
#define VP_SDK_DEPTH_VIRTUALIZE \
	__asm __emit 0xEB\
	__asm __emit 0x11\
	__asm __emit 0x44\
	__asm __emit 0x65\
	__asm __emit 0x70\
	__asm __emit 0x74\
	__asm __emit 0x68\
	__asm __emit 0x5F\
	__asm __emit 0x56\
	__asm __emit 0x69\
	__asm __emit 0x72\
	__asm __emit 0x74\
	__asm __emit 0x75\
	__asm __emit 0x61\
	__asm __emit 0x6C\
	__asm __emit 0x69\
	__asm __emit 0x7A\
	__asm __emit 0x65\
	__asm __emit 0x00;

//功能：乱序加密标记
//备注：不需要结束标记，程序会自动定位函数结尾
#define VP_SDK_MUTATION \
	__asm __emit 0xEB\
	__asm __emit 0x0C\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x4D\
	__asm __emit 0x75\
	__asm __emit 0x74\
	__asm __emit 0x61\
	__asm __emit 0x74\
	__asm __emit 0x69\
	__asm __emit 0x6F\
	__asm __emit 0x6E\
	__asm __emit 0x00;

//功能：深度乱序加密标记
//备注：不需要结束标记，程序会自动定位函数结尾	
#define VP_SDK_DEPTH_MUTATION \
	__asm __emit 0xEB\
	__asm __emit 0x12\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x44\
	__asm __emit 0x65\
	__asm __emit 0x70\
	__asm __emit 0x74\
	__asm __emit 0x68\
	__asm __emit 0x5F\
	__asm __emit 0x4D\
	__asm __emit 0x75\
	__asm __emit 0x74\
	__asm __emit 0x61\
	__asm __emit 0x74\
	__asm __emit 0x69\
	__asm __emit 0x6F\
	__asm __emit 0x6E\
	__asm __emit 0x00;

//功能：注册解码加密开始标记
//备注：需要配合结束标记（VP_SDK_REGDECODE_END）使用，并且需要使用授权系统。
#define VP_SDK_REGDECODE_START \
	__asm __emit 0xEB\
	__asm __emit 0x15\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x44\
	__asm __emit 0x4B\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x45\
	__asm __emit 0x47\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x43\
	__asm __emit 0x4F\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x54\
	__asm __emit 0x41\
	__asm __emit 0x00;

//功能：注册解码加密结束标记
//备注：需要配合开始标记（VP_SDK_REGDECODE_START）使用，并且需要使用授权系统。
#define VP_SDK_REGDECODE_END \
	__asm __emit 0xEB\
	__asm __emit 0x15\
	__asm __emit 0x56\
	__asm __emit 0x50\
	__asm __emit 0x5F\
	__asm __emit 0x53\
	__asm __emit 0x44\
	__asm __emit 0x4B\
	__asm __emit 0x5F\
	__asm __emit 0x52\
	__asm __emit 0x45\
	__asm __emit 0x47\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x43\
	__asm __emit 0x4F\
	__asm __emit 0x44\
	__asm __emit 0x45\
	__asm __emit 0x5F\
	__asm __emit 0x45\
	__asm __emit 0x4E\
	__asm __emit 0x44\
	__asm __emit 0x00;