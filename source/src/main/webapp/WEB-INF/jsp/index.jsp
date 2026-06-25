<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ホーム｜Classcare</title>

    <!-- flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <style>
        :root {
            /* カレンダー全体の横幅 */
            --calendar-width: 1000px;

            /* 1マスの高さ */
            --day-height: 100px;

            /* 1マスの横幅 */
            --day-width: calc(var(--calendar-width) / 7);
        }

        .flatpickr-calendar {
            width: var(--calendar-width) !important;
        }

        .flatpickr-weekdays,
        .flatpickr-days,
        .dayContainer {
            width: var(--calendar-width) !important;
            min-width: var(--calendar-width) !important;
            max-width: var(--calendar-width) !important;
        }

        span.flatpickr-weekday,
        .flatpickr-day {
            width: var(--day-width) !important;
            max-width: var(--day-width) !important;
            flex: none !important;
        }

        .flatpickr-day {
            height: var(--day-height) !important;
            line-height: 1.3 !important;
            padding: 10px 0 !important;
            cursor: pointer;
            overflow: hidden;
            box-sizing: border-box;
        }

        .flatpickr-day span.schedule-item {
            display: block;
            font-size: 11px;
            color: white;
            background: #4A90D9;
            border-radius: 3px;
            padding: 1px 4px;
            margin-top: 2px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            cursor: pointer;
        }

        body {
            font-family: sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
            background-color: #F9F9F9;
        }

        header, aside, main, footer {
            width: 100%;
            max-width: 1200px;
            box-sizing: border-box;
        }

        main {
            margin-top: 20px;
        }

        #calendar {
            margin-top: 16px;
        }
    </style>
</head>

<body>
    <header>
        <!-- ここからテンプレート -->
        <div>
            <!-- ロゴ写真 -->
            <span><img alt=""></span>
        </div>

        <c:if test="${empty sessionScope.user}">
            <nav>
                <form action="${pageContext.request.contextPath}/LoginServlet">
                    <button type="submit">ログイン</button>
                </form>
            </nav>
        </c:if>

        <c:if test="${not empty sessionScope.user}">
            <nav>
                <button type="button">ようこそ${sessionScope.user.name}さん</button>

                <form action="${pageContext.request.contextPath}/SigninServlet">
                    <button type="submit">サインイン（新規作成）</button>
                </form>

                <!--
                    本来ログアウト専用Servletがあるなら
                    LoginServlet ではなく LogoutServlet の方が自然です
                    例：
                    ${pageContext.request.contextPath}/LogoutServlet
                -->
                <form action="${pageContext.request.contextPath}/LoginServlet">
                    <button type="submit">ログアウト</button>
                </form>
            </nav>
        </c:if>
        <!-- テンプレート終了 -->
    </header>

    <!-- 左側サイドナビ -->
    <aside>
        <nav>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/SelectClassesServlet">生徒</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/SelectClassesServlet">生徒管理</a></li>
                        <li><a href="#">点数管理</a></li>
                        <li><a href="#">日記</a></li>
                    </ul>
                </li>

                <li><a href="#">成績</a></li>
                <ul>
                    <li><a href="#">得点</a></li>
                    <li><a href="#">心理テスト</a></li>
                </ul>

                <li><a href="">報告</a></li>
                <ul>
                    <li><a href="#">事案</a></li>
                    <li><a href="#">心理テスト</a></li>
                </ul>

                <li><a href="#">海外支援</a></li>
            </ul>
        </nav>
    </aside>

    <main>
        <h2>ホーム / 週間スケジュール設定</h2>

        <div><img src="" alt="いじめ警戒"></div>

        <!-- スケジュール用フォーム（必要なら使用） -->
        <div>
            <form action="${pageContext.request.contextPath}/IndexServlet">
                <div></div>
            </form>
        </div>

        <!-- スケジュール開始 -->
        <label>スケジュール</label><br>

        <!-- デバッグ確認用。確認後は削除してもよい -->
        <p>schedule件数: ${schedules.size()}</p>

        <!-- カレンダー表示領域 -->
        <div id="calendar"></div>
    </main>

    <footer>
        <p>虎視眈々(株)</p>
    </footer>

    <!-- flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>

    <script>
        // =========================================================
        // 【前提】
        // Servlet側ですでに以下が実行されていること
        //
        // request.setAttribute("schedules", schedules);
        // request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
        //
        // schedules の各要素は以下のプロパティ名で参照する
        //   ${item.schedule_id}
        //   ${item.date}
        //   ${item.subject}
        //   ${item.start_time}
        //   ${item.finish_time}
        //   ${item.type}
        //   ${item.memo}
        // =========================================================

        // =========================================================
        // 【予定が存在する日付一覧】
        // DBの日付文字列から先頭10文字だけを取り、
        // yyyy-MM-dd 形式として保持する
        //
        // 例:
        //   2026-06-08
        //   2026-06-08 00:00:00.0
        // どちらでも先頭10文字なら 2026-06-08 になる
        // =========================================================
        const scheduleDates = new Set();

        <c:forEach var="item" items="${schedules}">
        (function() {
            const rawDate = "${item.date}";
            const dateStr = rawDate ? rawDate.substring(0, 10) : "";
            if (dateStr) {
                scheduleDates.add(dateStr);
            }
        })();
        </c:forEach>

        console.log("scheduleDates =", Array.from(scheduleDates));

        // =========================================================
        // 【予定ラベル描画関数】
        // カレンダーの各日付セルに予定ラベルを追加する
        // 月変更・年変更のたびに再実行する
        // =========================================================
        function renderScheduleItems() {
            // 既存の予定ラベルを削除（再描画のため）
            document.querySelectorAll(".flatpickr-day .schedule-item").forEach(function(el) {
                el.remove();
            });

            <c:forEach var="item" items="${schedules}">
            (function() {
                // -------------------------------------------------
                // 【1】DBの日付を取得
                // 使用プロパティ：
                //   ${item.date}
                // -------------------------------------------------
                const rawDate = "${item.date}";
                const dateStr = rawDate ? rawDate.substring(0, 10) : "";
                if (!dateStr) return;

                // -------------------------------------------------
                // 【2】日付セルのIDを作成
                // 例：
                //   2026-06-08 → D20260608
                // -------------------------------------------------
                const cellId = "D" + dateStr.replace(/-/g, "");
                const cell = document.getElementById(cellId);
                if (!cell) return;

                // -------------------------------------------------
                // 【3】JavaBeanの値取得
                // あなたのBeanの命名が snake_case なので
                // JSP側でも snake_case を使う
                // -------------------------------------------------
                const scheduleId = "${item.schedule_id}";
                const subject    = "${item.subject}";
                const rawStart   = "${item.start_time}";
                const rawFinish  = "${item.finish_time}";
                const type       = "${item.type}";
                const memo       = "${item.memo}";

                // -------------------------------------------------
                // 【4】時間を HH:mm に整形
                // 例：
                //   09:30:00 → 09:30
                // -------------------------------------------------
                const startTime  = rawStart ? rawStart.substring(0, 5) : "";
                const finishTime = rawFinish ? rawFinish.substring(0, 5) : "";

                // -------------------------------------------------
                // 【5】予定ラベル生成
                //
                // 現在の表示内容：
                //   科目 + 開始時刻 + 種類
                //
                // もし変更したい場合：
                //
                // 【科目だけ表示】
                //   span.textContent = subject;
                //
                // 【科目 + 開始時刻だけ表示】
                //   span.textContent = subject + (startTime ? " " + startTime : "");
                //
                // 【メモを表示】
                //   span.textContent = memo;
                // -------------------------------------------------
                const span = document.createElement("span");
                span.className = "schedule-item";
                span.textContent =
                    subject +
                    (startTime ? " " + startTime : "") +
                    (type ? " [" + type + "]" : "");

                // -------------------------------------------------
                // 【6】種類(type)で色分け
                //
                // type は DB の「種類」項目
                // 例：
                //   授業 / 会議 / 面談 / 行事 など
                //
                // 不要ならこの if 文は削除してよい
                // -------------------------------------------------
                if (type === "授業") {
                    span.style.background = "#4A90D9"; // 青
                } else if (type === "会議") {
                    span.style.background = "#50B36A"; // 緑
                } else if (type === "面談") {
                    span.style.background = "#F5A623"; // オレンジ
                } else if (type === "行事") {
                    span.style.background = "#D9534F"; // 赤
                } else {
                    span.style.background = "#888888"; // その他
                }

                // -------------------------------------------------
                // 【7】ホバー時の補足情報
                // マウスを乗せると表示される
                // 不要なら削除してよい
                // -------------------------------------------------
                span.title =
                    "科目: " + subject + "\n" +
                    "開始: " + startTime + "\n" +
                    "終了: " + finishTime + "\n" +
                    "種類: " + type + "\n" +
                    "メモ: " + memo;

                // -------------------------------------------------
                // 【8】予定ラベルクリック時の遷移先
                //
                // このURLは何か？
                //   → 予定1件の詳細表示ページ
                //
                // 何のServletか？
                //   → 予定詳細表示サーブレット
                //
                // CRUD分類：
                //   → R（参照）
                //
                // 今の設定：
                //   /ScheduleDetailServlet?id=...
                //
                // もし編集画面へ行かせたいなら：
                //   /EditScheduleServlet?id=...
                //   → U（更新）
                //
                // もし削除確認画面へ行かせたいなら：
                //   /DeleteScheduleServlet?id=...
                //   → D（削除）
                // -------------------------------------------------
                span.onclick = function(event) {
                    event.stopPropagation();

                    window.location.href =
                        '${pageContext.request.contextPath}/ScheduleDetailServlet?id=' + scheduleId;
                };

                cell.appendChild(span);
            })();
            </c:forEach>
        }

        // =========================================================
        // 【flatpickr 初期化】
        // =========================================================
        flatpickr("#calendar", {
            inline: true,
            locale: "ja",
            dateFormat: "Y-m-d",

            // -----------------------------------------------------
            // 【9】予定がある場合、その最初の日付の月を初期表示
            // 理由：
            //   今月に予定がなければ何も見えず、
            //   「表示されていない」と勘違いしやすいため
            // -----------------------------------------------------
            defaultDate: (function() {
                const arr = Array.from(scheduleDates);
                return arr.length > 0 ? arr[0] : null;
            })(),

            // -----------------------------------------------------
            // 【10】各日付セルにIDを付ける
            //
            // 重要：
            //   UTC系メソッドは使わない
            //   日本時間では1日ずれる可能性があるため
            //
            // 正しい：
            //   getFullYear()
            //   getMonth()
            //   getDate()
            // -----------------------------------------------------
            onDayCreate: function(dObj, dStr, fp, dayElem) {
                const date = dayElem.dateObj;

                const y = date.getFullYear();
                const m = String(date.getMonth() + 1).padStart(2, '0');
                const d = String(date.getDate()).padStart(2, '0');

                dayElem.id = "D" + y + m + d;
            },

            // -----------------------------------------------------
            // 【11】初回表示時に予定を描画
            // -----------------------------------------------------
            onReady: function() {
                renderScheduleItems();
            },

            // -----------------------------------------------------
            // 【12】月を切り替えた時に再描画
            // -----------------------------------------------------
            onMonthChange: function() {
                renderScheduleItems();
            },

            // -----------------------------------------------------
            // 【13】年を切り替えた時に再描画
            // -----------------------------------------------------
            onYearChange: function() {
                renderScheduleItems();
            },

            // -----------------------------------------------------
            // 【14】日付クリック時の処理
            //
            // 重要：
            //   ここでも UTC ではなくローカル時刻を使う
            //
            // 予定がある日：
            //   → その日付の予定一覧画面へ遷移
            //   → 参照（R）
            //
            // 予定がない日：
            //   → 新規登録画面へ遷移
            //   → 作成（C）
            // -----------------------------------------------------
            onChange: function(selectedDates) {
                const date = selectedDates[0];
                if (!date) return;

                const y = date.getFullYear();
                const m = String(date.getMonth() + 1).padStart(2, '0');
                const d = String(date.getDate()).padStart(2, '0');
                const key = y + '-' + m + '-' + d;

                if (scheduleDates.has(key)) {
                    // =============================================
                    // 【要修改】
                    // 这是“有予定の日”点击后的 URL
                    //
                    // 何のURLか？
                    //   → その日付の予定一覧・参照画面
                    //
                    // 何のServletか？
                    //   → 予定一覧表示サーブレット
                    //   → 日付別予定参照サーブレット
                    //
                    // CRUD:
                    //   → R（参照）
                    //
                    // あなたの実際のServlet名に合わせて変更すること
                    // 例：
                    //   /SelectScheduleServlet
                    //   /ScheduleListServlet
                    //   /LoadScheduleServlet
                    // =============================================
                    window.location.href =
                        '${pageContext.request.contextPath}/SelectScheduleServlet?date=' + key;

                } else {
                    // =============================================
                    // 【要修改】
                    // 这是“予定がない日”点击后的 URL
                    //
                    // 何のURLか？
                    //   → 新しい予定を登録する画面
                    //
                    // 何のServletか？
                    //   → 予定登録画面表示サーブレット
                    //   → 新規予定追加サーブレット
                    //
                    // CRUD:
                    //   → C（新規作成）
                    //
                    // あなたの実際のServlet名に合わせて変更すること
                    // 例：
                    //   /AddScheduleServlet
                    //   /InsertScheduleServlet
                    //   /ScheduleEntryServlet
                    // =============================================
                    window.location.href =
                        '${pageContext.request.contextPath}/AddScheduleServlet?date=' + key;
                }
            }
        });
    </script>
</body>
</html>