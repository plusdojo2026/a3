package servlet;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * 日付を基にランダムデータを生成するユーティリティクラス。
 *
 * <p>
 * 本クラスは現在日付をシード（seed）として使用することで、 以下の特性を持つランダム結果を提供する：
 * <ul>
 * <li>同じ日付では常に同じ結果を生成する（再現性あり）</li>
 * <li>日付が変わると異なる結果になる</li>
 * <li>生成結果は重複しない</li>
 * </ul>
 *
 * <p>
 * 主な利用シーン：
 * <ul>
 * <li>日替わりコンテンツの表示（例：心理テスト）</li>
 * <li>ランダム推薦の生成</li>
 * </ul>
 *
 * <p>
 * 注意：
 * <ul>
 * <li>本クラスのランダム生成は疑似乱数であり、セキュリティ用途には適さない</li>
 * <li>ID生成は1から連番であることを前提としている</li>
 * </ul>
 */

public final class RandomUtil {
	private RandomUtil() {
	}

	/**
	 * 日付に基づいて、重複しないランダムIDリストを生成する。
	 *
	 * <p>
	 * 1からtotalCountまでの連番IDを生成し、それをシャッフルした後、 指定した件数だけ抽出する。
	 *
	 * @param totalCount データ総数（例：テーブルのレコード件数）
	 * @param limit      取得したいID数
	 * @return ランダムで重複のないIDリスト（最大limit件）
	 * @throws IllegalArgumentException totalCountまたはlimitが0以下の場合
	 */
	public static List<Integer> getRandomIds(int totalCount, int limit) {

		if (totalCount <= 0 || limit <= 0) {
			throw new IllegalArgumentException("totalCount と limit は 0 より大きい必要があります");
		}

		// 日付をシードとして設定
		long seed = LocalDate.now().toEpochDay();
		Random random = new Random(seed);

		// IDリスト生成（1～totalCount）
		List<Integer> list = new ArrayList<>();
		for (int i = 1; i <= totalCount; i++) {
			list.add(i);
		}

		// シャッフル
		Collections.shuffle(list, random);

		// limit件返却
		return list.subList(0, Math.min(limit, totalCount));
	}

	/**
	 * 日付に基づいて、指定されたリストからランダムに要素を抽出する。
	 *
	 * <p>
	 * 元のリストをシャッフルし、先頭からlimit件を抽出する。 元データを保護するため、内部でリストのコピーを作成して処理する。
	 *
	 * @param <T>   リストの要素型
	 * @param list  対象リスト
	 * @param limit 抽出する要素数
	 * @return ランダムに選ばれた要素のリスト（最大limit件）
	 */
	public static <T> List<T> getRandomList(List<T> list, int limit) {

		if (list == null || list.isEmpty() || limit <= 0) {
			return Collections.emptyList();
		}

		// 日付をシードとして設定
		Random random = new Random(LocalDate.now().toEpochDay());

		// 元リストのコピーを作成（副作用防止）
		List<T> copy = new ArrayList<>(list);

		// シャッフル
		Collections.shuffle(copy, random);

		// limit件返却
		return copy.subList(0, Math.min(limit, copy.size()));
	}
}