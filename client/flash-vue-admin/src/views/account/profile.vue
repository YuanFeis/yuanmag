<template>
  <div class="app-container">
    <div class="user">
      <strong>{{ user.name }}</strong><br>
      <small>{{ user.dept }} &nbsp;&nbsp; {{ user.roles }}</small>
    </div>
    <el-row class="user-content" style="">
      <el-col :span="6" class="profile">
        <img class="user-avatar" src="@/assets/img/avatar.gif"><br>
        <p><span class="title"><i class="el-icon-phone"></i>&nbsp;&nbsp;{{ user.phone }}</span></p>
        <p><span class="title"><i class="el-icon-message"></i>&nbsp;&nbsp;{{ user.email }}</span></p>
        <p><span class="title"><i class="el-icon-open"></i>&nbsp;&nbsp;{{ user.status == '1'?'启用' : '禁用' }}</span></p>
        <p><span class="title"><i class="el-icon-location-outline"></i>&nbsp;&nbsp;大连市开发区辽河西路18号</span></p>
      </el-col>
      <el-col :span="18" style="padding-left:10px;">
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="个人资料" name="profile"></el-tab-pane>
          <el-tab-pane label="最近活动" name="timeline"></el-tab-pane>
          <el-tab-pane label="修改密码" name="updatePwd"></el-tab-pane>
        </el-tabs>
        <el-form  label-width="80px">
          <h3>基本信息</h3>
          <el-form-item label="名称">
            <span>{{ user.name }}</span>
          </el-form-item>
          <el-form-item label="性别">
            <span> {{ user.sex = 1 ? '男' : '女' }}</span>
          </el-form-item>
          <el-form-item label="生日">
            <span> {{ user.birthday }}</span>
          </el-form-item>
          <h3>联系信息</h3>
          <el-form-item label="手机">
            <span>{{ user.phone }}</span>
          </el-form-item>
          <el-form-item label="邮箱">
            <span> {{ user.email }}</span>
          </el-form-item>
          <el-form-item label="地址">
            <span> 辽河西路18号</span>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>


  </div>
</template>

<script src="./profile.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
  @import "src/styles/common.scss";
</style>

