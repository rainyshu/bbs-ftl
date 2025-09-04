<#include "layout/layout.ftl"/>
<@html page_title="首页" page_tab="index">
  <style>
    .main-container {
      padding: 20px 0;
    }
    .nav-pills {
      border-bottom: 1px solid #f0f0f0;
      padding-bottom: 5px;
    }
    .nav-pills .nav-link {
      color: #666;
      font-weight: 500;
      padding: 8px 16px;
      margin-right: 5px;
      border-radius: 20px;
      transition: all 0.3s ease;
    }
    .nav-pills .nav-link:hover {
      background-color: #f5f5f5;
      color: #333;
    }
    .nav-pills .nav-link.active {
      background-color: #1890ff;
      color: white;
      box-shadow: 0 2px 8px rgba(24, 144, 255, 0.3);
    }
    .card {
      border: none;
      border-radius: 8px;
      box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
      margin-bottom: 20px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .card:hover {
      transform: translateY(-3px);
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
    }
    .card-header {
      background-color: #fff;
      border-bottom: 1px solid rgba(0, 0, 0, 0.05);
      padding: 12px 20px;
    }
    .alert {
      border-radius: 8px;
      border: none;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }
    @media (max-width: 768px) {
      .main-container {
        padding: 10px 0;
      }
      .nav-pills .nav-link {
        padding: 6px 12px;
        font-size: 14px;
      }
    }
  </style>
  <div class="main-container">
    <#if active?? && active>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            <strong>激活成功</strong>
        </div>
    </#if>
    <div class="row">
        <div class="col-12 col-lg-9">
            <div class="card mb-4">
                <div class="card-header">
                    <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link <#if tab=="all">active</#if>" href="/?tab=all">全部</a></li>
                        <li class="nav-item"><a class="nav-link <#if tab=="good">active</#if>" href="/?tab=good">精华</a></li>
                        <li class="nav-item"><a class="nav-link <#if tab=="hot">active</#if>" href="/?tab=hot">最热</a></li>
                        <li class="nav-item"><a class="nav-link <#if tab=="newest">active</#if>" href="/?tab=newest">最新</a></li>
                        <li class="nav-item"><a class="nav-link <#if tab=="noanswer">active</#if>" href="/?tab=noanswer">无人问津</a></li>
                    </ul>
                </div>
                <div class="card-body">
                    <@tag_topics pageNo=pageNo!1 tab=tab!"all">
                        <#include "components/topics.ftl"/>
                        <@topics page=page/>

                        <#include "components/paginate.ftl"/>
                        <@paginate currentPage=page.current totalPage=page.pages actionUrl="/" urlParas="&tab=${tab!}"/>
                    </@tag_topics>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-3">
          <div class="sticky-top" style="top: 20px;">
            <#if _user??>
                <#include "components/user_info.ftl"/>
            <#else>
                <#include "components/welcome.ftl"/>
            </#if>
              <#include "components/score.ftl"/>
              <@score limit=10/>
          </div>
        </div>
    </div>
  </div>
</@html>
