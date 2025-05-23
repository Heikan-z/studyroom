const menu = {
    list() {
        return [
            {
                "backMenu": [
                    {
                        "child": [
                            {"buttons": ["新增", "查看", "修改", "删除"], "menu": "学生", "menuJump": "列表", "tableName": "xuesheng"}
                        ],
                        "menu": "学生管理"
                    },
                    {
                        "child": [
                            {"buttons": ["查看", "修改", "删除", "审核"], "menu": "座位预订", "menuJump": "列表", "tableName": "zuoweiyuding"}
                        ],
                        "menu": "座位预订管理"
                    },
                    {
                        "child": [
                            {"buttons": ["新增", "查看", "修改", "删除"], "menu": "自习室", "menuJump": "列表", "tableName": "zixishi"}
                        ],
                        "menu": "自习室管理"
                    },
                    {
                        "child": [
                            {"buttons": ["新增", "查看", "修改", "删除"], "menu": "轮播图管理", "tableName": "config"},
                            {"buttons": ["新增", "查看", "修改", "删除"], "menu": "客服管理", "tableName": "chat"}
                        ],
                        "menu": "系统管理"
                    }
                ],
                "frontMenu": [
                    {
                        "child": [
                            {"buttons": ["查看"], "menu": "公告信息列表", "menuJump": "列表", "tableName": "gonggaoxinxi"}
                        ],
                        "menu": "公告信息模块"
                    },
                    {
                        "child": [
                            {"buttons": ["查看", "座位预计", "座位预订"], "menu": "自习室列表", "menuJump": "列表", "tableName": "zixishi"}
                        ],
                        "menu": "自习室模块"
                    }
                ],
                "hasBackLogin": "是",
                "hasBackRegister": "否",
                "hasFrontLogin": "否",
                "hasFrontRegister": "否",
                "roleName": "管理员",
                "tableName": "users"
            },
            {
                "backMenu": [
                    {
                        "child": [
                            {"buttons": ["查看", "删除", "修改"], "menu": "座位预订", "menuJump": "列表", "tableName": "zuoweiyuding"}
                        ],
                        "menu": "座位预订管理"
                    }
                ],
                "frontMenu": [
                    {
                        "child": [
                            {"buttons": ["查看"], "menu": "公告信息列表", "menuJump": "列表", "tableName": "gonggaoxinxi"}
                        ],
                        "menu": "公告信息模块"
                    },
                    {
                        "child": [
                            {"buttons": ["查看", "座位预计", "座位预订"], "menu": "自习室列表", "menuJump": "列表", "tableName": "zixishi"}
                        ],
                        "menu": "自习室模块"
                    }
                ],
                "hasBackLogin": "是",
                "hasBackRegister": "否",
                "hasFrontLogin": "是",
                "hasFrontRegister": "是",
                "roleName": "学生",
                "tableName": "xuesheng"
            }
        ]
    }
}
export default menu;
